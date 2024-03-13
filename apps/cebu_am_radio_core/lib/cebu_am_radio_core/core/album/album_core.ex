defmodule CebuAmRadioCore.Core.Album do
  alias CebuAmRadioCore.Core.Album.Actions.{Get, GetAll, Create}

  def get_album, do: Get
  def get_all_album, do: GetAll
  def create_album, do: Create
end
