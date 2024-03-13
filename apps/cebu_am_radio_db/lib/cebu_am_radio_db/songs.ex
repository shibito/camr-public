defmodule CebuAmRadioDb.Songs do
  @moduledoc """
  The Songs context.
  """

  import Ecto.Query, warn: false
  alias CebuAmRadioDb.Artists.Artist
  alias CebuAmRadioDb.Albums.Album
  alias CebuAmRadioDb.Repo

  alias CebuAmRadioDb.Songs.Song

  @doc """
  Returns the list of songs.

  ## Examples

      iex> list_songs()
      [%Song{}, ...]

  """
  def list_songs do
    Repo.all(Song)
  end

  @doc """
  Gets a single song.

  Raises `Ecto.NoResultsError` if the Song does not exist.

  ## Examples

      iex> get_song!(123)
      %Song{}

      iex> get_song!(456)
      ** (Ecto.NoResultsError)

  """
  def get_song!(id), do: Repo.get!(Song, id)

  @doc """
  Creates a song.

  ## Examples

      iex> create_song(%{field: value})
      {:ok, %Song{}}

      iex> create_song(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_song(attrs \\ %{}) do
    %Song{}
    |> Song.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a song.

  ## Examples

      iex> update_song(song, %{field: new_value})
      {:ok, %Song{}}

      iex> update_song(song, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_song(%Song{} = song, attrs) do
    song
    |> Song.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a song.

  ## Examples

      iex> delete_song(song)
      {:ok, %Song{}}

      iex> delete_song(song)
      {:error, %Ecto.Changeset{}}

  """
  def delete_song(%Song{} = song) do
    Repo.delete(song)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking song changes.

  ## Examples

      iex> change_song(song)
      %Ecto.Changeset{data: %Song{}}

  """
  def change_song(%Song{} = song, attrs \\ %{}) do
    Song.changeset(song, attrs)
  end

  def load_songs do
    from(s in Song)
  end

  def relationships(query, preload \\ []) do
    query
    |> load_album(:album in preload)
    |> load_artist(:artist in preload)
    |> load_album_join(:album_join in preload)
    |> load_artist_join(:artist_join in preload)
  end

  def get_track(query, album, year, artist, title) do
    from s in query,
      left_join: ar in Artist,
      on: ar.id == s.artist_uuid,
      left_join: al in Album,
      on: al.id == s.album_uuid,
      preload: [artist: ar, album: al],
      where: al.name == ^album,
      where: al.year == ^year,
      where: ar.name == ^artist,
      where: s.name == ^title
  end

  defp load_album(query, true), do: query |> preload(:album)
  defp load_album(query, _), do: query

  defp load_artist(query, true), do: query |> preload(:artist)
  defp load_artist(query, _), do: query

  defp load_album_join(query, true) do
    from s in query,
      left_join: al in Album,
      on: al.id == s.album_uuid,
      preload: [album: al]
  end

  defp load_album_join(query, _), do: query

  defp load_artist_join(query, true) do
    from s in query,
      left_join: ar in Artist,
      on: ar.id == s.artist_uuid,
      preload: [artist: ar]
  end

  defp load_artist_join(query, _), do: query
end
