defmodule CebuAmRadioCore.Core.Song do
  alias CebuAmRadioCore.Core.Song.Actions.{Get, GetAll, Create}

  def get_song, do: Get
  def get_all_song, do: GetAll
  def create_song, do: Create
end
