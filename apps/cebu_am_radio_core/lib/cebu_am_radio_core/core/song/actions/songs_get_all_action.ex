defmodule CebuAmRadioCore.Core.Song.Actions.GetAll do
  import CebuAmRadioDb.Songs, only: [load_songs: 0]
  import CebuAmRadioDb.Utlities, only: [all: 1]

  def run do
    load_songs()
    |> all()
  end
end
