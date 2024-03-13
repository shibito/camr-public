defmodule CebuAmRadioWeb.FooterPlayerComponent do
  use Phoenix.Component

  import CebuAmRadioWeb.SvgComponents


  attr :track, :map, default: nil, doc: "now playing track map"
  attr :live_action, :atom, default: nil, doc: "router live_action value"

  def footer_player(assigns) do
    ~H"""
    <%!-- Player Section --%>
    <section id="player">
      <div class="bg-zinc-800 absolute bottom-0 w-screen">
        <div class="flex justify-between m-2 px-3 items-center">
          <%= case @live_action do %>
            <% nil -> %>
              <div class="flex basis-1/3">
                <div class="w-20 h-20 rounded-xl text-center bg-gray-900 flex items-center justify-center space-x-1">
                  <span class="font-bold">LIVE</span>
                  <span class="relative flex h-3 w-3">
                    <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75">
                    </span>
                    <span class="relative inline-flex rounded-full h-3 w-3 bg-red-500"></span>
                  </span>
                </div>
              </div>
            <% _ -> %>
              <div :if={@track != nil} class="flex basis-1/3">
                <img class="w-20 h-20 rounded-xl" src={@track.album.cover} />
                <div class="flex flex-col pl-2">
                  <span class="font-bold">
                    <%= @track.name %>
                  </span>
                  <span class="font-thin">
                    <%= @track.artist.name %>
                  </span>
                  <span class="font-thin">
                    <%= @track.album.name %> (<%= @track.album.year %>)
                  </span>
                </div>
              </div>
              <div :if={@track == nil} class="flex basis-1/3">
                <img
                  class="w-20 h-20 rounded-xl"
                  src="https://s.static.cebuamradio.com/assets/jingle_1.svg"
                />
              </div>
          <% end %>

          <div id="play-container" class="basis-1/3 text-center" phx-update="ignore">
            <div class="flex justify-center space-x-4">
              <button id="mute-volume" class="text-gray-400">
                <.mute_volume_button />
              </button>
              <button id="play-stream" class="">
                <.play_button class="w-20 h-20" />
              </button>
              <button id="stop-stream" class="hidden">
                <.stop_button class="w-20 h-20" />
              </button>
              <button id="full-volume" class="text-gray-400">
                <.full_volume_button />
              </button>
            </div>
          </div>
          <div class="basis-1/3">
            <div class="float-right">
              <div class="flex items-center">
                <div class="w-6">
                  <.volume_icom />
                </div>
                <input type="range" id="volume-slider" class="h-2 w-50" phx-update="ignore" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
