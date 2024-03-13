defmodule CebuAmRadioDb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CebuAmRadioDb.Repo,
      {DNSCluster, query: Application.get_env(:cebu_am_radio_db, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CebuAmRadioDb.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CebuAmRadioDb.Finch},
      # Start a worker by calling: CebuAmRadioDb.Worker.start_link(arg)
      # {CebuAmRadioDb.Worker, arg}
      {Guardian.DB.Sweeper, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: CebuAmRadioDb.Supervisor)
  end
end
