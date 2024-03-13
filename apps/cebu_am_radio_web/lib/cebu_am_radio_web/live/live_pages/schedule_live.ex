defmodule CebuAmRadioWeb.LivePages.ScheduleLive do
  use Phoenix.Component
  import CebuAmRadioWeb.SmallPlayerComponent

  def schedule_param(socket, _) do
    socket
  end

  def schedule(assigns) do
    # TODO: Dynamic Daily Program Schedule List
    ~H"""
    <div class="text-shadow-10 flex items-center h-screen text-center relative -top-20 m-8 z-0 sm:-top-32">
      <div class="relative overflow-x-auto mx-auto container">
        <p class="text-center text-4xl font-bold mb-5">Daily Schedule (PH TIME GMT + 8)</p>

        <div class="grid gap-10 grid-cols-2 justify-items-center md:grid-cols-4">
          <div>
            <div class="h-20">
              <div class="text-2xl font-bold">BisRock / BisReggae</div>
            </div>

            <ul class="text-md xl:text-4xl">
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">M | W</div>
                <div class="font-bold">01:00 ~ 04:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">T | TH</div>
                <div class="font-bold">09:00 ~ 12:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">S | SU</div>
                <div class="font-bold">05:00 ~ 08:00</div>
              </li>
            </ul>
          </div>
          <div>
            <div class="h-20">
              <div class="text-2xl font-bold">MAOY’2X MAN</div>
            </div>

            <ul class="text-md xl:text-4xl">
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">M | W</div>
                <div class="font-bold">05:00 ~ 08:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">T | TH</div>
                <div class="font-bold">13:00 ~ 16:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">S | SU</div>
                <div class="font-bold">09:00 ~ 12:00</div>
              </li>
            </ul>
          </div>
          <div>
            <div class="h-20">
              <div class="text-2xl font-bold">MODERN BISAYA HITS</div>
            </div>

            <ul class="text-md xl:text-4xl">
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">M | W</div>
                <div class="font-bold">09:00 ~ 12:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">T | TH</div>
                <div class="font-bold">17:00 ~ 20:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">S | SU</div>
                <div class="font-bold">13:00 ~ 16:00</div>
              </li>
            </ul>
          </div>
          <div>
            <div class="h-20">
              <div class="text-2xl font-bold">CLASSIC HITS</div>
            </div>

            <ul class="text-md xl:text-4xl">
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">M | W</div>
                <div class="font-bold">13:00 ~ 16:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">T | TH</div>
                <div class="font-bold">21:00 ~ 24:00</div>
              </li>
              <li class="mb-2">
                <div class="font-thin underline underline-offset-4 decoration-2 mb-2">S | SU</div>
                <div class="font-bold">16:00 ~ 19:00</div>
              </li>
            </ul>
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
