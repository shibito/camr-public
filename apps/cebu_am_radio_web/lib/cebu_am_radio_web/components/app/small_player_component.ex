defmodule CebuAmRadioWeb.SmallPlayerComponent do
  use Phoenix.Component

  import CebuAmRadioWeb.SvgComponents

  def small_player(assigns) do
    ~H"""
    <div id="play-container-small" class="basis-1/3 text-center" phx-update="ignore">
      <button id="play-stream-small" class="">
        <.play_button class="w-20 h-20" />
      </button>
      <button id="stop-stream-small" class="hidden">
        <.stop_button class="w-20 h-20" />
      </button>
    </div>
    """
  end
end
