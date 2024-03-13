defmodule CebuAmRadioWeb.LivePages.IndexLive do
  use Phoenix.Component
  import CebuAmRadioWeb.SmallPlayerComponent
  import CebuAmRadioWeb.NowPlayingDefaultComponent

  def index_param(socket, _) do
    socket
  end

  def index(assigns) do
    ~H"""
    <div class="flex items-center h-screen text-center relative -top-24 m-8 z-0 sm:-top-32">
      <div class="mx-auto w-[500px]">
        <.default :if={@track != nil} track={@track} />
        <.jingle :if={@track == nil} track={@track} />

        <div class="p-7 sm:hidden">
          <.small_player />
        </div>
      </div>
    </div>
    """
  end
end
