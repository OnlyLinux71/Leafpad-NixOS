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

  # Configure with prefix
  configurePhase = ''
    ./autogen.sh || autoreconf -vi
    ./configure --prefix=$out
  '';

  # Ignore format-security warnings
  buildPhase = ''
    export CFLAGS="$CFLAGS -Wno-format-security"
    export CXXFLAGS="$CXXFLAGS -Wno-format-security"
    make
  '';

  installPhase = ''
    make install
  '';

  meta = {
    description = "Simple GTK text editor (from Savannah mirror)";
    license = pkgs.lib.licenses.gpl2;
    homepage = "https://savannah.nongnu.org/projects/leafpad";
  };
}
