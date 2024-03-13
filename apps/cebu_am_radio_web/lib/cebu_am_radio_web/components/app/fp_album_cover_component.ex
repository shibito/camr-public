defmodule CebuAmRadioWeb.FpAlbumCoverComponent do
  use Phoenix.Component

  attr :track, :map, default: nil, doc: "now playing track map"

  def full_page_cover(assigns) do
    ~H"""
    <style>
      .bg-image {
        background-image: url("<%= @track.album.cover %>");
      }
    </style>

    <div class="bg-image transition-all blur-lg h-full w-full bg-center bg-no-repeat bg-cover absolute top-0 opacity-40">
    </div>
    """
  end
end
