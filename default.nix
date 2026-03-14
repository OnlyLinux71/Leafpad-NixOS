{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "leafpad";
  version = "0.8.17";

  src = pkgs.fetchurl {
    url = "https://download-mirror.savannah.gnu.org/releases/leafpad/leafpad-0.8.17.tar.gz";
    sha256 = "jfjeeq6iYUgiW2EgYxtP5ridNtK1KWLnycwM4Hv9vUw="; # working hash
  };

  nativeBuildInputs = [
    pkgs.pkg-config pkgs.automake pkgs.autoconf pkgs.libtool pkgs.intltool
  ];

  buildInputs = [ pkgs.gtk2 ];

  # Copy icon and .desktop file during install
  installPhase = ''
    make install

    # Create directories in $out
    mkdir -p $out/share/pixmaps
    mkdir -p $out/share/applications

    # Copy your custom icon (put leafpad.png in the repo)
    cp leafpad.png $out/share/pixmaps/leafpad.png

    # Copy the desktop file (put leafpad.desktop in the repo)
    # Make sure Icon=$out/share/pixmaps/leafpad.png inside leafpad.desktop
    cp leafpad.desktop $out/share/applications/leafpad.desktop
  '';

  configurePhase = ''
    ./autogen.sh || autoreconf -vi
    ./configure --prefix=$out
  '';

  buildPhase = "make";

  meta = {
    description = "Simple GTK text editor (from Savannah mirror) with icon and desktop entry";
    license = pkgs.lib.licenses.gpl2;
  };
}
