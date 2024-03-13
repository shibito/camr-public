defmodule CebuAmRadioDb.Artists do
  @moduledoc """
  The Artists context.
  """

  import Ecto.Query, warn: false
  # alias CebuAmRadioDb.Songs.Song
  # alias CebuAmRadioDb.Albums.Album
  alias CebuAmRadioDb.Repo

  alias CebuAmRadioDb.Artists.Artist

  @doc """
  Returns the list of artists.

  ## Examples

      iex> list_artists()
      [%Artist{}, ...]

  """
  def list_artists do
    Repo.all(Artist)
  end

  @doc """
  Gets a single artist.

  Raises `Ecto.NoResultsError` if the Artist does not exist.

  ## Examples

      iex> get_artist!(123)
      %Artist{}

      iex> get_artist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_artist!(id), do: Repo.get!(Artist, id)

  @doc """
  Creates a artist.

  ## Examples

      iex> create_artist(%{field: value})
      {:ok, %Artist{}}

      iex> create_artist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_artist(attrs \\ %{}) do
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a artist.

  ## Examples

      iex> update_artist(artist, %{field: new_value})
      {:ok, %Artist{}}

      iex> update_artist(artist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_artist(%Artist{} = artist, attrs) do
    artist
    |> Artist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a artist.

  ## Examples

      iex> delete_artist(artist)
      {:ok, %Artist{}}

      iex> delete_artist(artist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_artist(%Artist{} = artist) do
    Repo.delete(artist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking artist changes.

  ## Examples

      iex> change_artist(artist)
      %Ecto.Changeset{data: %Artist{}}

  """
  def change_artist(%Artist{} = artist, attrs \\ %{}) do
    Artist.changeset(artist, attrs)
  end

  def load_artists do
    from(o in Artist)
  end

  def relationships(query, preload \\ []) do
    query
    |> load_albums(:albums in preload)
    |> load_songs(:songs in preload)
    |> load_albums_join(:albums_join in preload)
    |> load_songs_join(:songs_join in preload)
  end

  defp load_albums(query, true), do: query |> preload(:album)
  defp load_albums(query, _), do: query

  defp load_songs(query, true), do: query |> preload(:song)
  defp load_songs(query, _), do: query

  defp load_albums_join(query, true) do
    from ar in query,
      join: s in assoc(ar, :song),
      join: al in assoc(ar, :album),
      preload: [album: al]
  end

  defp load_albums_join(query, _), do: query

  defp load_songs_join(query, true) do
    from ar in query,
      join: s in assoc(ar, :song),
      preload: [song: s]
  end

  defp load_songs_join(query, _), do: query
end
