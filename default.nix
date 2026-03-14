{ pkgs ? import <nixpkgs> {} }:

let
  icon = ./leafpad.png;
  desktopFile = ./leafpad.desktop;
in

pkgs.stdenv.mkDerivation {
  pname = "leafpad";
  version = "0.8.17";

  src = pkgs.fetchurl {
    url = "https://download-mirror.savannah.gnu.org/releases/leafpad/leafpad-0.8.17.tar.gz";
    sha256 = "jfjeeq6iYUgiW2EgYxtP5ridNtK1KWLnycwM4Hv9vUw=";
  };

  nativeBuildInputs = [
    pkgs.pkg-config pkgs.automake pkgs.autoconf pkgs.libtool pkgs.intltool pkgs.patch
  ];

  buildInputs = [ pkgs.gtk2 ];

  configurePhase = ''
    ./autogen.sh || autoreconf -vi
    ./configure --prefix=$out
  '';

  # Patch dialog.c to fix format-security errors
  patchPhase = ''
    substituteInPlace src/dialog.c \
      --replace 'g_print(str);' 'g_print("%s", str);' \
      --replace 'g_message(str);' 'g_message("%s", str);'
  '';

  buildPhase = "make";

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
