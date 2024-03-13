defmodule CebuAmRadioCore.Core.Artist.Actions.GetAll do
  import CebuAmRadioDb.Artists, only: [load_artists: 0]
  import CebuAmRadioDb.Utlities, only: [all: 1]

  def run do
    load_artists()
    |> all()
  end
end
