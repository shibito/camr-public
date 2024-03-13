defmodule CebuAmRadioCore.Core.Album.Actions.Create do
  alias CebuAmRadioDb.Albums

  def run(attr) when is_map(attr) do
    Albums.create_album(attr)
  end
end
