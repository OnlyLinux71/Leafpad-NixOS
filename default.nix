{ pkgs ? import <nixpkgs> {} }:

let
  # Make sure the icon and desktop file are included in the build
  icon = builtins.path { path = ./leafpad.png; };
  desktopFile = builtins.path { path = ./leafpad.desktop; };
in

pkgs.stdenv.mkDerivation {
  pname = "leafpad";
  version = "0.8.17";

  src = pkgs.fetchurl {
    url = "https://download-mirror.savannah.gnu.org/releases/leafpad/leafpad-0.8.17.tar.gz";
    sha256 = "jfjeeq6iYUgiW2EgYxtP5ridNtK1KWLnycwM4Hv9vUw=";
  };

  nativeBuildInputs = [
    pkgs.pkg-config pkgs.automake pkgs.autoconf pkgs.libtool pkgs.intltool
  ];

  buildInputs = [ pkgs.gtk2 ];

  configurePhase = ''
    ./autogen.sh || autoreconf -vi
    ./configure --prefix=$out
  '';

  # Disable format-security errors so it compiles on modern GCC
  buildPhase = ''
    export CFLAGS="$CFLAGS -Wno-format-security"
    make
  '';

  installPhase = ''
    make install

    # Install icon
    mkdir -p $out/share/pixmaps
    cp ${icon} $out/share/pixmaps/leafpad.png

    # Install desktop file
    mkdir -p $out/share/applications
    cp ${desktopFile} $out/share/applications/
  '';

  meta = {
    description = "Simple GTK text editor (from Savannah mirror)";
    license = pkgs.lib.licenses.gpl2;
  };
}
