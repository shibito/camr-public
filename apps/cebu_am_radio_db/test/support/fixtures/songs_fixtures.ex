defmodule CebuAmRadioDb.SongsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CebuAmRadioDb.Songs` context.
  """

  import CebuAmRadioDb.AlbumsFixtures

  @doc """
  Generate a song.
  """
  def song_fixture(attrs \\ %{}) do
    album = album_fixture()

    {:ok, song} =
      attrs
      |> Enum.into(%{
        album_uuid: album.id,
        artist_uuid: album.artist_uuid,
        name: "some name",
        request_count: 0
      })
      |> CebuAmRadioDb.Songs.create_song()

    song
  end
end
