// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html";
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import topbar from "../vendor/topbar";

let Hooks = {};

Hooks.AudioPlay = {
  mounted() {
    const playerEl = this.el;
    const playButtonEl = document.getElementById("play-stream");
    const stopButtonEl = document.getElementById("stop-stream");
    const playButtonSmallEl = document.getElementById("play-stream-small");
    const stopButtonSmallEl = document.getElementById("stop-stream-small");
    const fullVolumeButtonEl = document.getElementById("full-volume");
    const muteVolumeButtonEl = document.getElementById("mute-volume");
    const volumeEl = document.getElementById("volume-slider");

    playerEl.src = "https://stream.cebuamradio.com/stream";

    playButtonEl.addEventListener("click", () => {
      playButtonEl.classList.add("animate-pulse");
      playerEl.play();
    });

    stopButtonEl.addEventListener("click", () => {
      playerEl.pause();
    });

    stopButtonSmallEl.addEventListener("click", () => {
      playerEl.pause();
    });

    playButtonSmallEl.addEventListener("click", () => {
      playButtonSmallEl.classList.add("animate-pulse");
      playerEl.play();
    });

    fullVolumeButtonEl.addEventListener("click", () => {
      playerEl.volume = 1;
      volumeEl.value = 100;
    });

    muteVolumeButtonEl.addEventListener("click", () => {
      playerEl.volume = 0;
      volumeEl.value = 0;
    });

    playerEl.onplaying = function (e) {
      playButtonEl.classList.add("hidden");
      stopButtonEl.classList.remove("hidden");

      playButtonSmallEl.classList.add("hidden");
      stopButtonSmallEl.classList.remove("hidden");

      playButtonEl.classList.remove("animate-pulse");
      playButtonSmallEl.classList.remove("animate-pulse");

      e.currentTarget.volume = volumeEl.value / 100;
    };

    playerEl.onpause = function (e) {
      stopButtonEl.classList.add("hidden");
      playButtonEl.classList.remove("hidden");

      stopButtonSmallEl.classList.add("hidden");
      playButtonSmallEl.classList.remove("hidden");

      e.currentTarget.volume = volumeEl.value / 100;
    };

    volumeEl.addEventListener("change", setVolume);
    volumeEl.addEventListener("input", setVolume);

    function setVolume(e) {
      playerEl.volume = e.currentTarget.value / 100;
    }
  },
};

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: { _csrf_token: csrfToken },
  hooks: Hooks,
});

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" });
window.addEventListener("phx:page-loading-start", (_info) => topbar.show(300));
window.addEventListener("phx:page-loading-stop", (_info) => topbar.hide());

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;
