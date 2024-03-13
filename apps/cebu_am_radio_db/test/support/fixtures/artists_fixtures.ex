defmodule CebuAmRadioDb.ArtistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CebuAmRadioDb.Artists` context.
  """

  @doc """
  Generate a artist.
  """
  def artist_fixture(attrs \\ %{}) do
    {:ok, artist} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CebuAmRadioDb.Artists.create_artist()

    artist
  end
end
