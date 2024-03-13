defmodule CebuAmRadioCore.Core.Album.Actions.Get do
  import CebuAmRadioDb.Albums, only: [load_albums: 0, relationships: 2]
  import CebuAmRadioDb.Utlities, only: [get: 2]

  def run(uuid, preload \\ []) when is_binary(uuid) and is_list(preload) do
    load_albums()
    |> relationships(preload)
    |> get(uuid)
  end
end
