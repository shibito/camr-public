defmodule CebuAmRadioCore.Interface.Album do
  alias CebuAmRadioCore.Core.Artist

  defdelegate get_artist, to: Artist
  defdelegate get_all_artist, to: Artist
  defdelegate create_artist, to: Artist
end
