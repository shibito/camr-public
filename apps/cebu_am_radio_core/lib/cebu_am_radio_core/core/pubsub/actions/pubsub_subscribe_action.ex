defmodule CebuAmRadioCore.Core.Pubsub.Actions.Subscribe do
  def run(name) do
    Phoenix.PubSub.subscribe(CebuAmRadioDb.PubSub, name)
  end
end
