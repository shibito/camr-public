defmodule CebuAmRadioDb.Albums.AlbumResolver do
  alias CebuAmRadioDb.Utlities
  alias CebuAmRadioDb.Albums

  def all_albums(_root, param, _info) do
    query =
      Albums.load_albums()
      |> relations(param)
      |> Utlities.all()

    {:ok, query}
  end

  def find_album(_root, param, _info) do
    query =
      Albums.load_albums()
      |> relations(param)
      |> get_one(param)

    {:ok, query}
  end

  defp relations(query, %{join: true}),
    do: query |> Albums.relationships([:artist_join, :songs_join])

  defp relations(query, _), do: query

  defp get_one(query, %{id: uuid}) do
    query |> Utlities.get(uuid)
  end
end
