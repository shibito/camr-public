defmodule CebuAmRadioCore.Core.Artist.Actions.Create do
  alias CebuAmRadioDb.Artists

  def run(attr) when is_map(attr) do
    Artists.create_artist(attr)
  end
end
