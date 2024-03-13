defmodule CebuAmRadioCore.Core.Pubsub.Actions.Broadcast do
  def run(name, param) do
    Phoenix.PubSub.broadcast(CebuAmRadioDb.PubSub, name, param)
  end
end
