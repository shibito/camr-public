defmodule CebuAmRadioWeb.SvgComponents do
  use Phoenix.Component

  def play_button(assigns) do
    ~H"""
    <svg
      width="75px"
      height="75px"
      viewBox="0 0 16 16"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns="http://www.w3.org/2000/svg"
      version="1.1"
      id="svg2"
      fill="currentColor"
    >
      <%!-- class="w-6 h-6" --%>
      <g transform="translate(0 -1036.362)" id="layer1">
        <path
          id="path828"
          transform="translate(0 1036.362)"
          d="M8 1a7 7 0 0 0-7 7 7 7 0 0 0 7 7 7 7 0 0 0 7-7 7 7 0 0 0-7-7zm0 1a6 6 0 0 1 6 6 6 6 0 0 1-6 6 6 6 0 0 1-6-6 6 6 0 0 1 6-6z"
          style="opacity:1;vector-effect:none;fill:currentColor;fill-opacity:1;stroke:none;stroke-width:4;stroke-linecap:square;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:3.20000005;stroke-opacity:.55063291"
        />

        <path
          id="rect891"
          d="m6 1041.362 5 3-5 3z"
          style="opacity:1;vector-effect:none;fill:currentColor;fill-opacity:1;stroke:none;stroke-width:4;stroke-linecap:square;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:3.20000005;stroke-opacity:.55063291"
        />
      </g>
    </svg>
    """
  end

  def stop_button(assigns) do
    ~H"""
    <svg
      width="75px"
      height="75px"
      viewBox="0 0 16 16"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns="http://www.w3.org/2000/svg"
      version="1.1"
      id="svg2"
      fill="currentColor"
    >
      <g transform="translate(0 -1036.362)" id="layer1">
        <path
          id="path828"
          transform="translate(0 1036.362)"
          d="M8 1a7 7 0 0 0-7 7 7 7 0 0 0 7 7 7 7 0 0 0 7-7 7 7 0 0 0-7-7zm0 1a6 6 0 0 1 6 6 6 6 0 0 1-6 6 6 6 0 0 1-6-6 6 6 0 0 1 6-6z"
          style="opacity:1;vector-effect:none;fill:currentColor;fill-opacity:1;stroke:none;stroke-width:4;stroke-linecap:square;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:3.20000005;stroke-opacity:.55063291"
        />

        <rect
          y="1041.3622"
          x="5"
          height="6"
          width="6"
          id="rect891"
          style="opacity:1;vector-effect:none;fill:currentColor;fill-opacity:1;stroke:none;stroke-width:4;stroke-linecap:square;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:3.20000005;stroke-opacity:.55063291"
        />
      </g>
    </svg>
    """
  end

  def mute_volume_button(assigns) do
    ~H"""
    <svg
      width="50px"
      height="50px"
      viewBox="0 0 22 22"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
      xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
      id="svg4355"
      version="1.1"
      inkscape:version="0.92.1 r15371"
      sodipodi:docname="dark_audio-volume-mute.svg"
      fill="currentColor"
    >
      <sodipodi:namedview
        id="base"
        pagecolor="#ffffff"
        bordercolor="#666666"
        borderopacity="1.0"
        inkscape:pageopacity="0.0"
        inkscape:pageshadow="2"
        inkscape:zoom="16.301626"
        inkscape:cx="5.9506004"
        inkscape:cy="10.557163"
        inkscape:document-units="px"
        inkscape:current-layer="layer1"
        showgrid="true"
        width="0px"
        height="0px"
        fit-margin-top="0"
        fit-margin-left="0"
        fit-margin-right="0"
        fit-margin-bottom="0"
        inkscape:window-width="1884"
        inkscape:window-height="1051"
        inkscape:window-x="0"
        inkscape:window-y="0"
        inkscape:window-maximized="1"
        inkscape:showpageshadow="false"
      >
        <inkscape:grid type="xygrid" id="grid4112" />

        <sodipodi:guide
          position="2.0000011,19.999996"
          orientation="18,0"
          id="guide4118"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="2.0000011,1.9999962"
          orientation="0,18"
          id="guide4120"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="20.000001,1.9999962"
          orientation="-18,0"
          id="guide4122"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="20.000001,19.999996"
          orientation="0,-18"
          id="guide4124"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="3.0000011,18.999996"
          orientation="16,0"
          id="guide4126"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="3.0000011,2.9999962"
          orientation="0,16"
          id="guide4128"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="19.000001,2.9999962"
          orientation="-16,0"
          id="guide4130"
          inkscape:locked="false"
        />

        <sodipodi:guide
          position="19.000001,18.999996"
          orientation="0,-16"
          id="guide4132"
          inkscape:locked="false"
        />
      </sodipodi:namedview>

      <g
        inkscape:label="Capa 1"
        inkscape:groupmode="layer"
        id="layer1"
        transform="translate(-544.571 -742.934)"
      >
        <path
          inkscape:connector-curvature="0"
          style="fill:currentColor;fill-opacity:1;stroke:none"
          d="m555.56 745.933-4.989 4.99v6.02l4.989 4.99h1.011V745.935h-1.011zm-7.989 5v6h2v-6z"
          class="ColorScheme-Text"
          id="path6"
          sodipodi:nodetypes="ccccccccccccccccccccccc"
        />

        <path
          style="color:currentColor;fill:currentColor;fill-opacity:1;stroke:none"
          d="M557.571 752.934v2h6v-2h-6z"
          class="ColorScheme-NegativeText"
          id="path8"
          inkscape:connector-curvature="0"
        />
      </g>
    </svg>
    """
  end

  def full_volume_button(assigns) do
    ~H"""
    <svg
      width="50px"
      height="50px"
      viewBox="0 0 22 22"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
      xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
      id="svg4355"
      version="1.1"
      inkscape:version="0.92.1 r15371"
      sodipodi:docname="dark_audio-volume-high.svg"
      fill="currentColor"
    >
      <g
        inkscape:label="Capa 1"
        inkscape:groupmode="layer"
        id="layer1"
        transform="translate(-544.571 -742.934)"
      >
        <path
          inkscape:connector-curvature="0"
          style="fill:currentColor;fill-opacity:1;stroke:none"
          d="m555.56 745.933-4.989 4.99v6.02l4.989 4.99h1.011V745.935h-1.011zm2.877.537-.245.977a7 7 0 0 1 4.38 6.486 7 7 0 0 1-4.381 6.479l.244.974a8 8 0 0 0 5.136-7.453 8 8 0 0 0-5.134-7.463zm.459 3.744-.54.862a4 4 0 0 1 1.215 2.857 4 4 0 0 1-1.21 2.861l.539.864a5 5 0 0 0 1.671-3.725 5 5 0 0 0-1.675-3.719zm-11.325.72v6h2v-6h-2z"
          class="ColorScheme-Text"
          id="path6"
        />
      </g>
    </svg>
    """
  end

  def volume_icom(assigns) do
    ~H"""
    <svg
      viewBox="0 0 22 22"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
      xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
      id="svg4355"
      version="1.1"
      inkscape:version="0.92.1 r15371"
      sodipodi:docname="dark_audio-none.svg"
      fill="currentColor"
    >
      <g
        inkscape:label="Capa 1"
        inkscape:groupmode="layer"
        id="layer1"
        transform="translate(-544.571 -742.934)"
      >
        <path
          inkscape:connector-curvature="0"
          style="fill:currentColor;fill-opacity:1;stroke:none"
          d="m555.56 745.933-4.989 4.99v6.02l4.989 4.99h1.011V745.935h-1.011zm-7.989 5v6h2v-6z"
          class="ColorScheme-Text"
          id="path6"
          sodipodi:nodetypes="ccccccccccccccccccccccc"
        />
      </g>
    </svg>
    """
  end
end
