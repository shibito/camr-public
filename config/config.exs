# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :cebu_am_radio_db, CebuAmRadioDb.Auth.Guardian,
  issuer: "cebu_am_radio_db",
  secret_key: "gavVzfQrz3Gs2HS4ZS/z3RHQRtWQvOISR+l2Lm7V2Xc1DbrpEE3nMMJMQFaTS+ao"

# Configure Mix tasks and generators
config :cebu_am_radio_db,
  ecto_repos: [CebuAmRadioDb.Repo]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :cebu_am_radio_db, CebuAmRadioDb.Mailer, adapter: Swoosh.Adapters.Local

config :cebu_am_radio_web,
  ecto_repos: [CebuAmRadioDb.Repo],
  generators: [context_app: :cebu_am_radio_db]

# Configures the endpoint
config :cebu_am_radio_web, CebuAmRadioWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: CebuAmRadioWeb.ErrorHTML, json: CebuAmRadioWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: CebuAmRadioDb.PubSub,
  live_view: [signing_salt: "25xiono3"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  cebu_am_radio_web: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/cebu_am_radio_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  cebu_am_radio_web: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/cebu_am_radio_web/assets", __DIR__)
  ]

config :guardian, Guardian.DB,
  repo: CebuAmRadioDb.Repo,
  schema_name: "guardian_tokens",
  sweep_interval: 60

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
import Config

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
