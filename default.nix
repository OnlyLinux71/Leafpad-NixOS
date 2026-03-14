{ pkgs ? import <nixpkgs> {} }:

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

  # Fix compiler errors: ignore format-security warnings
  NIX_CFLAGS_COMPILE = "-Wno-format-security";

  configurePhase = ''
    ./autogen.sh || autoreconf -vi
    ./configure --prefix=$out
  '';

  buildPhase = "make";

  # Install icon and .desktop file
  installPhase = ''
    make install

    # Pixmaps for custom icon
    mkdir -p $out/share/pixmaps
    cp leafpad.png $out/share/pixmaps/leafpad.png

    # Applications folder for desktop entry
    mkdir -p $out/share/applications
    cp leafpad.desktop $out/share/applications/leafpad.desktop
  '';

  meta = {
    description = "Simple GTK text editor (Leafpad 0.8.17) with icon and desktop entry";
    license = pkgs.lib.licenses.gpl2;
  };
}
