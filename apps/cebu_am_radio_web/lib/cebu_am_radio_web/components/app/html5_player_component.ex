defmodule CebuAmRadioWeb.Html5PlayerComponent do
  use Phoenix.Component

  def html5_player(assigns) do
    ~H"""
    <!-- HTML5 Player  -->
    <audio id="audio-player" preload="none" phx-hook="AudioPlay">
      <%!-- <source src="https://stream.cebuamradio.com/stream" type="audio/mpeg" /> --%>
    </audio>
    <!-- HTML5 Player END -->
    """
  end
end
