defmodule CebuAmRadioWeb.LivePages.AboutLive do
  use Phoenix.Component
  import CebuAmRadioWeb.SmallPlayerComponent

  def about_param(socket, _) do
    socket
  end

  def about(assigns) do
    ~H"""
    <div class="flex items-center h-screen text-center relative -top-20 m-8 z-0 text-shadow-10 sm:-top-32 ">
      <div class="container mx-auto text-left">
        <div class="pb-20">
          <div class="flex m-2 lg:space-x-8">
            <img
              class="w-72 hidden lg:block"
              src="https://s.static.cebuamradio.com/assets/CMAR_LOGO_WHITE.svg"
              alt="CEBU AM RADIO LOGO"
            />
            <div class="font-mono">
              <div class="text-4xl pb-5">CebuAmRadio</div>
              <div class="text-sm lg:text-xl">
                Was founded in 2013 after the Typhoon Yolanda as a personal project just for me to monitor local AM news even if I'm outside the country, now it is a discreet radio station dedicated to serving and promoting local bisaya talents.
              </div>
            </div>
          </div>
        </div>
        <div class="flex flex-col space-y-5  m-2">
          <div class="text-4xl">
            Copyright Disclaimer:
          </div>
          <div class="text-sm lg:text-xl">
            All music played on <span class="font-thin"> CebuAmRadio [Project] </span>
            is used under the principles of fair use for educational, informational, and non-commercial purposes. The selection of music is intended to provide comfort, entertainment, and support to our listeners.
          </div>

          <div class="text-sm lg:text-xl">
            If you are the copyright holder of any music played on
            <span class="font-thin"> CebuAmRadio [Project] </span>
            and wish for it to be removed, please contact us at <span class="font-thin">admin[ at ]cebuamradio.com</span>, and we will promptly comply with your request.
          </div>
          <div class="text-sm lg:text-xl">
            Thank you for your understanding.
          </div>
        </div>
      </div>

      <div class="hidden">
        <.small_player />
      </div>
    </div>
    """
  end
end
