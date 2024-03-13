defmodule CebuAmRadioCore.Core.Artist do
  alias CebuAmRadioCore.Core.Artist.Actions.{Get, GetAll, Create}

  def get_artist, do: Get
  def get_all_artist, do: GetAll
  def create_artist, do: Create
end
