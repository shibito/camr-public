defmodule CebuAmRadioWeb.TrackController do
  use CebuAmRadioWeb, :controller

  alias CebuAmRadioCore.Interface.Pubsub

  def track(conn, %{
        "data" => %{"album" => album, "artist" => artist, "title" => title, "year" => year}
      }) do
    resource = Guardian.Plug.current_resource(conn)

    if resource.type != "liquidsoap" do
      render(conn |> json(%{error: :unauthorized}) |> halt())
    end

    result =
      case CebuAmRadioCore.Interface.Song.get_song().track(album, year, artist, title) do
        [] ->
          nil

        [result] ->
          %{song_uuid: result.id}
          |> CebuAmRadioCore.Interface.Played.create_played().run()

          result
      end

    # Phoenix.PubSub.broadcast(CebuAmRadioDb.PubSub, "track_update", {:track_update, result})

    Pubsub.broadcast().run("track_update", {:track_update, result})

    render(conn,
      # data: result
      data: :ok
    )
  end
end
