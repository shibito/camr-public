defmodule CebuAmRadioDb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :cebu_am_radio_core,
    error_handler: CebuAmRadioDb.Auth.ErrorHandler,
    module: CebuAmRadioDb.Auth.Guardian

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
