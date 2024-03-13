defmodule CebuAmRadioWeb.HomeLive do
  use CebuAmRadioWeb, :live_view

  alias CebuAmRadioCore.Interface.{Played, Song}
  alias CebuAmRadioCore.Interface.Pubsub

  import CebuAmRadioWeb.LivePages.{IndexLive, ScheduleLive, AboutLive}
  import CebuAmRadioWeb.{Html5PlayerComponent, FooterPlayerComponent, FpAlbumCoverComponent}

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket =
      if connected?(socket) do
        Pubsub.subscribe().run("track_update")

        last_playing =
          case Played.get_played().last() do
            nil ->
              %{}

            last_track ->
              last_track.song_uuid
              |> Song.get_song().run([:album_join, :artist_join])
          end

        assign(socket,
          track: last_playing,
          page_title: "#{last_playing.name} :: #{last_playing.artist.name}"
        )
      else
        assign(socket,
          track: %{}
        )
      end

    {:ok, socket, layout: {CebuAmRadioWeb.Layouts, :dash}}
  end

  @impl Phoenix.LiveView
  def handle_params(params, _uri, socket) do
    socket =
      if connected?(socket) do
        socket
        |> param_actions(socket.assigns.live_action, params)
      else
        socket
      end

    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <.full_page_cover :if={@track != %{} and @track != nil} track={@track} />

    <%!-- Instead of umouting / mounting a new liveview, we insted use the same live-view on all pages --%>
    <%= case @live_action do %>
      <% :schedule -> %>
        <.schedule />
      <% :about -> %>
        <.about />
      <% _ -> %>
        <.index :if={@track != %{}} track={@track} />
    <% end %>

    <div class="hidden sm:block">
      <.footer_player :if={@track != %{}} track={@track} live_action={@live_action} />
    </div>
    <.html5_player />
    """
  end

  @impl Phoenix.LiveView
  def handle_info({:track_update, track}, socket) do
    IO.inspect(["track_update", track])

    page_title =
      if track != nil do
        "#{track.name} :: #{track.artist.name}"
      else
        "Welcome!!"
      end

    {:noreply, socket |> assign(track: track, page_title: page_title)}
  end

  defp param_actions(socket, :schedule, params), do: schedule_param(socket, params)
  defp param_actions(socket, :about, params), do: about_param(socket, params)
  defp param_actions(socket, _, params), do: index_param(socket, params)
end
