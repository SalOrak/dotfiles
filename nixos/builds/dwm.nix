{
  pkgs ? import <nixpkgs> {}
}:


pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";
  src = pkgs.fetchgit {
    url = "git://git.suckless.org/dwm";
    rev = "6.5";
    hash = "sha256-Cc4B8evvuRxOjbeOhg3oAs3Nxi/msxWg950/eiq536w=";
  };

  buildInputs = with pkgs; [
    gcc
    gnumake
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];

  buildPhase =  ''
    make all
'';

  installPhase = ''
  mkdir -p $out/bin
  mv dwm $out/bin/dwm
'';
}
