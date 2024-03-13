defmodule CebuAmRadioCore.Core.Artist.Actions.Get do
  import CebuAmRadioDb.Artists, only: [load_artists: 0, relationships: 2]
  import CebuAmRadioDb.Utlities, only: [get: 2]

  def run(uuid, preload \\ []) when is_binary(uuid) and is_list(preload) do
    load_artists()
    |> relationships(preload)
    |> get(uuid)
  end
end
