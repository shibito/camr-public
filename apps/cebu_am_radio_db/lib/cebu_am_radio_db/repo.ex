defmodule CebuAmRadioDb.Repo do
  use Ecto.Repo,
    otp_app: :cebu_am_radio_db,
    adapter: Ecto.Adapters.Postgres
end
