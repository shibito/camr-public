defmodule CebuAmRadioCore.Interface.Song do
  alias CebuAmRadioCore.Core.Song

  defdelegate get_song, to: Song
  defdelegate get_all_song, to: Song
  defdelegate create_song, to: Song
end
