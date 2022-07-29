{ stdenv, pkg-config, fetchFromGitHub, cairo, gst_all_1, systemd, libsndfile
, openal, curl, pulseaudio, alsa-lib, libGL, libGLU, glew, glm, utf8cpp, boost
, pugixml, uriparser, kissfft, rtaudio, freeimage, freeglut, glfw, libX11
, libXrandr, nlohmann_json, jsoncpp, fetchpatch }:

let
  libtess2 = stdenv.mkDerivation rec {
    pname = "libtess2";
    version = "1.0.2";

    src = fetchFromGitHub {
      owner = "memononen";
      repo = "libtess2";
      rev = "v${version}";
      sha256 = "sha256-mDxvfaLvFhLO1drw7f+KX97i+3dJCxFvXyxze5HsW4U=";
    };

    buildPhase = ''
      runHook preBuild

      gcc -shared -IInclude Source/*.c -o libtess.so

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/include
      cp Include/tesselator.h $out/include

      mkdir -p $out/lib
      cp libtess.so $out/lib

      runHook postInstall
    '';
  };
  ofxNetworkUtils = stdenv.mkDerivation rec {
    pname = "ofxNetworkUtils";
    version = "1";

    src = fetchFromGitHub {
      owner = "bakercp";
      repo = "ofxNetworkUtils";
      rev = "c862b71b02af1b5b1103be192e0959c0dcc3f1df";
      sha256 = "sha256-eQmJN5jO8060T2rDJjFAGO8veOmKhWk7gJaE0un0j80=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  ofxOscilloscope = stdenv.mkDerivation rec {
    pname = "ofxOscilloscope";
    version = "1";

    src = fetchFromGitHub {
      owner = "produceconsumerobot";
      repo = "ofxOscilloscope";
      rev = "2f80fb96ae0b1ce4ef9db5150358c6a9c1e8d03c";
      sha256 = "sha256-T3w/mPpz6VatP7xfxkiWDCk0SymRQvV7PJygkU1ai9o=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  ofxJSON = stdenv.mkDerivation rec {
    pname = "ofxJSON";
    version = "1";

    src = fetchFromGitHub {
      owner = "jeffcrouse";
      repo = "ofxJSON";
      rev = "55a5825ddf510c991466f9d39d8e1d57b2bc2008";
      sha256 = "sha256-YRqFgGN1S8yFztV2UndtOal4zd37TWjbYznXusB989s=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  ofxThreadedLogger = stdenv.mkDerivation rec {
    pname = "ofxThreadedLogger";
    version = "1";

    src = fetchFromGitHub {
      owner = "produceconsumerobot";
      repo = "ofxThreadedLogger";
      rev = "a7b051c39357a23f04e536ae2345e82c1c1eb090";
      sha256 = "sha256-AETDERlyY7DsYMM9BXkwra3czRjrVGJV8wvJE89cwOg=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  ofxBiquadFilter = stdenv.mkDerivation rec {
    pname = "ofxBiquadFilter";
    version = "1";

    src = fetchFromGitHub {
      owner = "smukkejohan";
      repo = "ofxBiquadFilter";
      rev = "47eb7fc3829156168dbb4081e3fcc3d3cdda2610";
      sha256 = "sha256-EqBQpAu2UEgWJPFyOed8zvGGaYX8t9iisubs1hhSbbg=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  ofxLSL = stdenv.mkDerivation rec {
    pname = "ofxLSL";
    version = "1";

    src = fetchFromGitHub {
      owner = "EmotiBit";
      repo = "ofxLSL";
      rev = "779f9a754c73fbc689d9387be0b4678f840a5f09";
      sha256 = "sha256-uD4gIFyzJx1UcDLNvhhZG78xso7YKdVrRFV7VrGTNCo=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  EmotiBit_XPlat_Utils = stdenv.mkDerivation rec {
    pname = "EmotiBit_XPlat_Utils";
    version = "1";

    src = fetchFromGitHub {
      owner = "EmotiBit";
      repo = "EmotiBit_XPlat_Utils";
      rev = "d884611d9ba785cd7323e5a834731e6774276b58";
      sha256 = "sha256-Ep545+8GsI3GBZC3A9mnGfbMAvSSTe9Hpcobb2esNbg=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
  ofxEmotiBit = stdenv.mkDerivation rec {
    pname = "ofxEmotiBit";
    version = "1";

    src = fetchFromGitHub {
      owner = "EmotiBit";
      repo = "ofxEmotiBit";
      rev = "867b0b16ac50c967fdc8c1bf05f003b32ae12667";
      sha256 = "sha256-0sBhvyGxsrIN3ABDsWtQ1qO7O5pMVdkU6egP5wN9WrI=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';
  };
in stdenv.mkDerivation rec {
  pname = "openframeworks";
  version = "0.11.2";

  src = fetchFromGitHub {
    owner = "openframeworks";
    repo = "openFrameworks";
    rev = version;
    sha256 = "sha256-JeYHQRnV3GXqEd0LKeoBcxgcBNWErD6F66Tks3iW2q8=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    cairo
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    systemd
    libsndfile
    openal
    curl
    pulseaudio
    alsa-lib
    libGL
    libGLU
    glew
    libtess2
    glm
    utf8cpp
    boost
    pugixml
    uriparser
    kissfft
    rtaudio
    freeimage
    freeglut
    glfw
    libX11
    libXrandr
    nlohmann_json
    # ofxJSON
    jsoncpp
  ];

  patches = [
    (fetchpatch {
      url =
        "https://github.com/openframeworks/openFrameworks/commit/290dbfc23930425024c9456b5c5519611fb1990d.patch";
      sha256 = "sha256-lgEEzRXgPMIjOF20SFq1iCjK3LfStkluY4Cd0MIHpbU=";
    })
  ];

  postPatch = ''
    substituteInPlace libs/openFrameworks/utils/ofUtils.h \
      --replace '#include "utf8.h"' '#include "utf8cpp/utf8.h"'

    substituteInPlace libs/openFrameworks/graphics/ofTrueTypeFont.cpp \
      --replace '#include "utf8.h"' '#include "utf8cpp/utf8.h"'

    substituteInPlace libs/openFrameworks/sound/ofOpenALSoundPlayer.h \
      --replace '#include "kiss_fft.h"' '#include "kissfft/kiss_fft.h"' \
      --replace '#include "kiss_fftr.h"' '#include "kissfft/kiss_fftr.h"'

    substituteInPlace libs/openFrameworks/utils/ofJson.h \
      --replace '#include "json.hpp"' '#include "nlohmann/json.hpp"'
  '';

  buildPhase = ''
    runHook preBuild

    srcdir="$PWD"

    cp -r ${ofxNetworkUtils} $srcdir/addons/ofxNetworkUtils
    chmod -R +w $srcdir/addons/ofxNetworkUtils
    cp -r ${ofxOscilloscope} $srcdir/addons/ofxOscilloscope
    chmod -R +w $srcdir/addons/ofxOscilloscope
    cp -r ${ofxJSON} $srcdir/addons/ofxJSON
    chmod -R +w $srcdir/addons/ofxJSON
    cp -r ${ofxThreadedLogger} $srcdir/addons/ofxThreadedLogger
    chmod -R +w $srcdir/addons/ofxThreadedLogger
    cp -r ${ofxBiquadFilter} $srcdir/addons/ofxBiquadFilter
    chmod -R +w $srcdir/addons/ofxBiquadFilter
    cp -r ${ofxLSL} $srcdir/addons/ofxLSL
    chmod -R +w $srcdir/addons/ofxLSL
    cp -r ${EmotiBit_XPlat_Utils} $srcdir/addons/EmotiBit_XPlat_Utils
    chmod -R +w $srcdir/addons/EmotiBit_XPlat_Utils
    cp -r ${ofxEmotiBit} $srcdir/addons/ofxEmotiBit
    chmod -R +w $srcdir/addons/ofxEmotiBit

    cd libs/openFrameworksCompiled/project
    make

    cd $srcdir/addons/ofxEmotiBit/EmotiBitOscilloscope
    make

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r $srcdir/libs $out
    cp -r $srcdir/addons $out

    runHook postInstall
  '';

  dontPatchELF = true;
}
