{ stdenv, pkg-config, fetchFromGitHub, cairo, gst_all_1, systemd, libsndfile
, openal, curl, pulseaudio, alsa-lib, libGL, libGLU, glew, glm, utf8cpp, boost
, pugixml, uriparser, kissfft, rtaudio, freeimage, freeglut, glfw, libX11
, libXrandr, nlohmann_json, jsoncpp, poco, libXxf86vm, libXcursor, libXinerama
, libXi, fetchpatch, cmake, bossa }:

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
  liblsl = stdenv.mkDerivation rec {
    pname = "liblsl";
    version = "1.14.0";

    src = fetchFromGitHub {
      owner = "sccn";
      repo = "liblsl";
      rev = "v${version}";
      sha256 = "sha256-/YLtmVvhzn1AFagRDQE+lwNyLaxRul2klWVrwynsMSo=";
    };

    patches = [
      ./liblsl.patch # e16db0524f52ee74288f313d63f361e2499fda26
    ];

    nativeBuildInputs = [ cmake ];
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
  ofxSerial = stdenv.mkDerivation rec {
    pname = "ofxSerial";
    version = "1";

    src = fetchFromGitHub {
      owner = "bakercp";
      repo = "ofxSerial";
      rev = "7a02ff97c02fdd038e367806128415ed794e48c7";
      sha256 = "sha256-dr6Xw5t4EGt63d2uXRBL+FIqVT0FVNVoGcKj0l5qF7c=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';

    postPatch = ''
      substituteInPlace libs/ofxSerial/include/ofx/IO/SerialDevice.h \
        --replace '#include "json.hpp"' '#include "nlohmann/json.hpp"'
    '';
  };
  ofxIO = stdenv.mkDerivation rec {
    pname = "ofxIO";
    version = "1";

    src = fetchFromGitHub {
      owner = "bakercp";
      repo = "ofxIO";
      rev = "9b55d4b3f5006c427947076270c92ba0dd706409";
      sha256 = "sha256-uaNiY4gIEfqsocdRaY7lPScrZt3zL8t50WB9nXZ9QKU=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';

    postPatch = ''
      substituteInPlace src/ofxIO.h \
        --replace '#include "json.hpp"' '#include "nlohmann/json.hpp"'
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
      rev = "32c2e83e67f452b1afff575932f392e19bdcadcc";
      sha256 = "sha256-pa5f71bR41HSI23UnF6J1doSpQlEhYbMtQWSDW7mcYk=";
    };

    buildPhase = "true";

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r * $out

      runHook postInstall
    '';

    # TODO: move libtess2/kissfft to openframeworks flags
    postPatch = ''
      rm EmotiBitOscilloscope/bin/liblsl-1.14.0-manylinux2010_x64.so
      rm EmotiBitOscilloscope/bin/lsl.dll

      substituteInPlace EmotiBitOscilloscope/config.make \
        --replace 'PROJECT_LDFLAGS=-Wl,-rpath=./libs,./bin/liblsl-1.14.0-manylinux2010_x64.so' 'PROJECT_LDFLAGS=-ltess -lkissfft-double -llsl'

      substituteInPlace EmotiBitFirmwareInstaller/config.make \
        --replace '# PROJECT_LDFLAGS=-Wl,-rpath=./libs' 'PROJECT_LDFLAGS=-ltess -lkissfft-double -llsl'

      substituteInPlace EmotiBitFirmwareInstaller/src/ofApp.cpp \
        --replace 'command = "bossac";' 'command = "${bossa}/bin/bossac";'
    '';
  };
in stdenv.mkDerivation rec {
  pname = "openframeworks";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "openframeworks";
    repo = "openFrameworks";
    rev = version;
    sha256 = "sha256-oLLpns6jTIoqGzUQBKAD5UoQNlyVCvA9JpeRkd021uo=";
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
    poco
    libXxf86vm
    libXcursor
    libXinerama
    libXi
    # ofxJSON
    jsoncpp
    # ofxLSL
    liblsl
  ];

  patches = [
    (fetchpatch {
      url =
        "https://github.com/openframeworks/openFrameworks/commit/290dbfc23930425024c9456b5c5519611fb1990d.patch";
      sha256 = "sha256-lgEEzRXgPMIjOF20SFq1iCjK3LfStkluY4Cd0MIHpbU=";
    })
    (fetchpatch {
      url =
        "https://github.com/openframeworks/openFrameworks/commit/2bee6a395dba12839a5043e3a1f282e3fd7b24dd.patch";
      sha256 = "sha256-JIDsWCWroqaa5woLF87fsFg3mq0H0U+Z1A+63VIBA18=";
    })
    ./make.patch # f23c71da938452cb42d4c0bfaef087afc26db82e
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
    cp -r ${ofxSerial} $srcdir/addons/ofxSerial
    chmod -R +w $srcdir/addons/ofxSerial
    cp -r ${ofxIO} $srcdir/addons/ofxIO
    chmod -R +w $srcdir/addons/ofxIO
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

    cd $srcdir/addons/ofxEmotiBit/EmotiBitFirmwareInstaller
    make

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r $srcdir/libs $out
    cp -r $srcdir/addons $out

    mkdir -p $out/bin
    ln -s $out/addons/ofxEmotiBit/EmotiBitOscilloscope/bin/EmotiBitOscilloscope $out/bin
    ln -s $out/addons/ofxEmotiBit/EmotiBitFirmwareInstaller/bin/EmotiBitFirmwareInstaller $out/bin

    runHook postInstall
  '';

  dontPatchELF = true;
}
