defmodule CebuAmRadioDb.PlayedList do
  @moduledoc """
  The PlayedList context.
  """

  import Ecto.Query, warn: false
  # alias CebuAmRadioDb.Songs.Song
  alias CebuAmRadioDb.Repo

  alias CebuAmRadioDb.PlayedList.Played

  @doc """
  Returns the list of played_list.

  ## Examples

      iex> list_played_list()
      [%Played{}, ...]

  """
  def list_played_list do
    Repo.all(Played)
  end

  @doc """
  Gets a single played.

  Raises `Ecto.NoResultsError` if the Played does not exist.

  ## Examples

      iex> get_played!(123)
      %Played{}

      iex> get_played!(456)
      ** (Ecto.NoResultsError)

  """
  def get_played!(id), do: Repo.get!(Played, id)

  @doc """
  Creates a played.

  ## Examples

      iex> create_played(%{field: value})
      {:ok, %Played{}}

      iex> create_played(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_played(attrs \\ %{}) do
    %Played{}
    |> Played.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a played.

  ## Examples

      iex> update_played(played, %{field: new_value})
      {:ok, %Played{}}

      iex> update_played(played, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_played(%Played{} = played, attrs) do
    played
    |> Played.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a played.

  ## Examples

      iex> delete_played(played)
      {:ok, %Played{}}

      iex> delete_played(played)
      {:error, %Ecto.Changeset{}}

  """
  def delete_played(%Played{} = played) do
    Repo.delete(played)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking played changes.

  ## Examples

      iex> change_played(played)
      %Ecto.Changeset{data: %Played{}}

  """
  def change_played(%Played{} = played, attrs \\ %{}) do
    Played.changeset(played, attrs)
  end

  def load_playing do
    from(a in Played)
  end

  def relationships(query, preload \\ []) do
    query
    |> load_songs(:song in preload)
    |> load_songs_join(:song_join in preload)
  end

  def all(query, opts \\ []) do
    query |> Repo.all(opts)
  end

  def get(query, uuid, opts \\ []) do
    if Ecto.UUID.cast(uuid) == :error do
      nil
    else
      query |> Repo.get(uuid, opts)
    end
  end

  def get_last(query) do
    query |> order_by(desc: :updated_at) |> limit(1) |> Repo.one()
  end

  defp load_songs(query, true), do: query |> preload(:song)
  defp load_songs(query, _), do: query

  defp load_songs_join(query, true) do
    from p in query,
      join: s in assoc(p, :song),
      preload: [song: s]
  end

  defp load_songs_join(query, _), do: query
end
