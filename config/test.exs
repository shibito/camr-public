import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :cebu_am_radio_db, CebuAmRadioDb.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "cebu_am_radio_db_test#{System.get_env("MIX_TEST_PARTITION")}",
  port: 5433,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cebu_am_radio_web, CebuAmRadioWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "viTNYMyqDhPp5qoho9aKlczuqZjGu06gVrZCfUeluhtK9wA07RBbPUgarCYPi8JP",
  server: false
