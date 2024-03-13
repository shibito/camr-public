defmodule CebuAmRadioCore.Core.Song.Actions.Create do
  alias CebuAmRadioDb.Songs

  def run(attr) when is_map(attr) do
    Songs.create_song(attr)
  end
end
