with import <nixpkgs> {};

mkShell {
  buildInputs = [
    pkg-config automake autoconf libtool intltool gtk2
  ];
}
