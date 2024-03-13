defmodule CebuAmRadioDb.Songs.SongResolver do
  alias CebuAmRadioDb.Utlities
  alias CebuAmRadioDb.Songs

  def all_songs(_root, param, _info) do
    query =
      Songs.load_songs()
      |> relations(param)
      |> Utlities.all()

    {:ok, query}
  end

  def find_song(_root, param, _info) do
    query =
      Songs.load_songs()
      |> relations(param)
      |> get_one(param)

    {:ok, query}
  end

  defp relations(query, %{join: true}),
    do: query |> Songs.relationships([:album_join, :artist_join])

  defp relations(query, _), do: query

  defp get_one(query, %{id: uuid}) do
    query |> Utlities.get(uuid)
  end
end
