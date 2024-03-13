defmodule CebuAmRadioDb.AlbumsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CebuAmRadioDb.Albums` context.
  """

  import CebuAmRadioDb.ArtistsFixtures

  @doc """
  Generate a album.
  """
  def album_fixture(attrs \\ %{}) do

    artist = artist_fixture()

    {:ok, album} =
      attrs
      |> Enum.into(%{
        artist_uuid: artist.id,
        cover: "some cover",
        name: "some name",
        year: "some year"
      })
      |> CebuAmRadioDb.Albums.create_album()

    album
  end
end
