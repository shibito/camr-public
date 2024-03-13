defmodule CebuAmRadioWeb.Router do
  alias Guardian.Plug.EnsureAuthenticated
  alias CebuAmRadioDb.Auth.Pipeline
  use CebuAmRadioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CebuAmRadioWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Pipeline
  end

  pipeline :ensure_auth do
    plug EnsureAuthenticated
  end

  scope "/", CebuAmRadioWeb do
    pipe_through :browser

    # get "/", PageController, :home

    live "/", HomeLive
    live "/schedule", HomeLive, :schedule
    live "/about", HomeLive, :about
  end

  # Absinthe API stack
  scope "/api" do
    pipe_through [:api, :auth, :ensure_auth]

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CebuAmRadioDb.Absinthe.Schema,
      interface: :simple
  end

  # Other scopes may use custom stacks.
  scope "/api", CebuAmRadioWeb do
    pipe_through [:api, :auth, :ensure_auth]

    post "/track", TrackController, :track
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:cebu_am_radio_web, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CebuAmRadioWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
