defmodule CebuAmRadioCore.Core.Played do
  alias CebuAmRadioCore.Core.Played.Actions.{Get, GetAll, Create}

  def get_played, do: Get
  def get_all_played, do: GetAll
  def create_played, do: Create
end
