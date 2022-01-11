{ lib, stdenv, fetchurl, ncurses }:

stdenv.mkDerivation rec {
  pname = "tudu";
  version = "0.10.4";

  src = fetchurl {
    url =
      "https://github.com/abstractednoah/tudu/archive/419d8f82fd723d291042776a84f0835a7d9a6285.tar.gz";
    sha256 = "ad9309b3e6d38ed492d9d5cb70363f4582b68cd68aa03d9fbe46b9a84b848158";
  };

  buildInputs = [ ncurses ];

  preConfigure = lib.optionalString stdenv.cc.isClang ''
    substituteInPlace configure \
      --replace 'echo "main()' 'echo "int main()'
  '';

  meta = with lib; {
    description = "ncurses-based hierarchical todo list manager with vim-like keybindings";
    homepage = "https://code.meskio.net/tudu/";
    license = licenses.gpl3;
    platforms = platforms.unix;
  };
}
