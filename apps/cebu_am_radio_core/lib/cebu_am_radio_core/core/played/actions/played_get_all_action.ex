defmodule CebuAmRadioCore.Core.Played.Actions.GetAll do
  import CebuAmRadioDb.PlayedList, only: [load_playing: 0, all: 1]

  def run do
    load_playing()
    |> all()
  end
end
