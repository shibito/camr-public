defmodule CebuAmRadioDb.Artists.ArtistResolver do
  alias CebuAmRadioDb.Artists
  alias CebuAmRadioDb.Utlities

  def all_artists(_root, param, _info) do
    query =
      Artists.load_artists()
      |> relations(param)
      |> Utlities.all()

    {:ok, query}
  end

  def find_artist(_root, param, _info) do
    query =
      Artists.load_artists()
      |> relations(param)
      |> get_one(param)

    {:ok, query}
  end

  defp relations(query, %{join: true}),
    do: query |> Artists.relationships([:albums_join, :songs_join])

  defp relations(query, _), do: query

  defp get_one(query, %{id: uuid}) do
    query |> Utlities.get(uuid)
  end
end
