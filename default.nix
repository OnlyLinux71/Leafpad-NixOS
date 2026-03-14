{ stdenv, fetchurl, pkg-config, automake, autoconf, libtool, intltool, gtk2 }:

stdenv.mkDerivation {
  pname = "leafpad";
  version = "0.8.17";

  src = fetchurl {
    url = "https://download-mirror.savannah.gnu.org/releases/leafpad/leafpad-0.8.17.tar.gz";
    sha256 = "jfjeeq6iYUgiW2EgYxtP5ridNtK1KWLnycwM4Hv9vUw="; # working hash
  };

  nativeBuildInputs = [ pkg-config automake autoconf libtool intltool ];
  buildInputs = [ gtk2 ];

  configurePhase = ''
    ./autogen.sh || autoreconf -vi
    ./configure --prefix=$out
  '';
  buildPhase = "make";
  installPhase = "make install";

  meta = {
    description = "Simple GTK text editor (Leafpad 0.8.17)";
    license = stdenv.lib.licenses.gpl2;
  };
}
