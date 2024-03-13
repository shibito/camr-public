defmodule CebuAmRadioCore.Core.Pubsub do
  alias CebuAmRadioCore.Core.Pubsub.Actions.{Subscribe, Broadcast}

  def subscribe, do: Subscribe
  def broadcast, do: Broadcast
end
