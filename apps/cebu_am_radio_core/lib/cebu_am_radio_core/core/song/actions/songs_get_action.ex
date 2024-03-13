defmodule CebuAmRadioCore.Core.Song.Actions.Get do
  import CebuAmRadioDb.Songs, only: [load_songs: 0, relationships: 2, get_track: 5]
  import CebuAmRadioDb.Utlities, only: [get: 2, all: 1]

  def run(uuid, relationship \\ []) when is_binary(uuid) do
    load_songs()
    |> relationships(relationship)
    |> get(uuid)
  end

  def track(album, year, artist, title) do
    load_songs()
    |> get_track(album, year, artist, title)
    |> all()
  end
end
