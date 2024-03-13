defmodule CebuAmRadioCore.Interface.Played do
  alias CebuAmRadioCore.Core.Played

  defdelegate get_played, to: Played
  defdelegate get_all_played, to: Played
  defdelegate create_played, to: Played
end
