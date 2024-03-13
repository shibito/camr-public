defmodule CebuAmRadioDb.PlayedListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CebuAmRadioDb.PlayedList` context.
  """

  import CebuAmRadioDb.SongsFixtures

  @doc """
  Generate a played.
  """
  def played_fixture(attrs \\ %{}) do

    song = song_fixture()

    {:ok, played} =
      attrs
      |> Enum.into(%{
        song_uuid: song.id
      })
      |> CebuAmRadioDb.PlayedList.create_played()

    played
  end
end
