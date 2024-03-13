defmodule CebuAmRadioDb.Albums do
  @moduledoc """
  The Albums context.
  """

  import Ecto.Query, warn: false
  # alias CebuAmRadioDb.Songs.Song
  # alias CebuAmRadioDb.Artists.Artist
  alias CebuAmRadioDb.Repo

  alias CebuAmRadioDb.Albums.Album

  @doc """
  Returns the list of albums.

  ## Examples

      iex> list_albums()
      [%Album{}, ...]

  """
  def list_albums do
    Repo.all(Album)
  end

  @doc """
  Gets a single album.

  Raises `Ecto.NoResultsError` if the Album does not exist.

  ## Examples

      iex> get_album!(123)
      %Album{}

      iex> get_album!(456)
      ** (Ecto.NoResultsError)

  """
  def get_album!(id), do: Repo.get!(Album, id)

  @doc """
  Creates a album.

  ## Examples

      iex> create_album(%{field: value})
      {:ok, %Album{}}

      iex> create_album(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_album(attrs \\ %{}) do
    %Album{}
    |> Album.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a album.

  ## Examples

      iex> update_album(album, %{field: new_value})
      {:ok, %Album{}}

      iex> update_album(album, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_album(%Album{} = album, attrs) do
    album
    |> Album.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a album.

  ## Examples

      iex> delete_album(album)
      {:ok, %Album{}}

      iex> delete_album(album)
      {:error, %Ecto.Changeset{}}

  """
  def delete_album(%Album{} = album) do
    Repo.delete(album)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking album changes.

  ## Examples

      iex> change_album(album)
      %Ecto.Changeset{data: %Album{}}

  """
  def change_album(%Album{} = album, attrs \\ %{}) do
    Album.changeset(album, attrs)
  end

  def load_albums do
    from(a in Album)
  end

  def relationships(query, preload \\ []) do
    query
    |> load_artists(:artist in preload)
    |> load_songs(:songs in preload)
    |> load_artists_join(:artist_join in preload)
    |> load_songs_join(:songs_join in preload)
  end

  defp load_artists(query, true), do: query |> preload(:artist)
  defp load_artists(query, _), do: query

  defp load_songs(query, true), do: query |> preload(:song)
  defp load_songs(query, _), do: query

  defp load_artists_join(query, true) do
    from al in query,
      join: s in assoc(al, :song),
      join: ar in assoc(al, :artist),
      preload: [artist: ar]
  end

  defp load_artists_join(query, _), do: query

  defp load_songs_join(query, true) do
    from al in query,
      join: s in assoc(al, :song),
      preload: [song: s]
  end

  defp load_songs_join(query, _), do: query
end
