defmodule CebuAmRadioWeb.NowPlayingDefaultComponent do
  use Phoenix.Component

  attr :track, :map, default: nil, doc: "now playing track map"

  def default(assigns) do
    ~H"""
    <div class="text-sm font-thin pb-5 animate-pulse ">
      Now Playing
    </div>

    <img src={@track.album.cover} class="rounded-xl" />

    <div class="flex flex-col space-y-1 text-center pt-5 text-shadow-10">
      <div class="text-3xl font-bold">
        <%= @track.name %>
      </div>
      <div class="text-xl">
        <%= @track.artist.name %>
      </div>
      <div class="font-light">
        <%= @track.album.name %> (<%= @track.album.year %>)
      </div>
    </div>
    """
  end

  def jingle(assigns) do
    ~H"""
    <div class="text-sm font-thin pb-5 animate-pulse ">
      Now Playing
    </div>

    <img
      src="https://s.static.cebuamradio.com/assets/jingle_1.svg"
      class="rounded-xl bg-black border-10 border-black"
    />

    <div class="flex flex-col space-y-1 text-center pt-5 animate-pulse">
      <div class="text-3xl font-bold">
        CEBU AM RADIO
      </div>
      <div class="text-xl" style="visibility: hidden">
        CEBU AM RADIO
      </div>
      <div class="font-light" style="visibility: hidden">
        CEBU AM RADIO
      </div>
    </div>
    """
  end
end
