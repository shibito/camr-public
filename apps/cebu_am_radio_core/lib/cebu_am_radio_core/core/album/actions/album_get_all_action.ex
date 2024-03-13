defmodule CebuAmRadioCore.Core.Album.Actions.GetAll do
  import CebuAmRadioDb.Albums, only: [load_albums: 0]
  import CebuAmRadioDb.Utlities, only: [all: 1]

  def run do
    load_albums()
    |> all()
  end
end
