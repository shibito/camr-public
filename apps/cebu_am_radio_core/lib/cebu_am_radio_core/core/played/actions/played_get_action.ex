defmodule CebuAmRadioCore.Core.Played.Actions.Get do
  import CebuAmRadioDb.PlayedList, only: [load_playing: 0, get: 2, get_last: 1, relationships: 2]

  def run(uuid) when is_binary(uuid) do
    load_playing()
    |> get(uuid)
  end

  def last(relationship \\ []) do
    load_playing()
    |> relationships(relationship)
    |> get_last()
  end
end
