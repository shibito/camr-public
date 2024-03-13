defmodule CebuAmRadioCore.Interface.Pubsub do
  alias CebuAmRadioCore.Core.Pubsub

  defdelegate subscribe, to: Pubsub
  defdelegate broadcast, to: Pubsub
end
