defmodule CebuAmRadioCore.Core.Played.Actions.Create do
  alias CebuAmRadioDb.PlayedList

  def run(attr) when is_map(attr) do
    PlayedList.create_played(attr)
  end
end
