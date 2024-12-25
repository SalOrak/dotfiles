{
  pkgs ? import <nixpkgs> {}
}:

pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dwm-setup";
    rev = "db5903c61e82ab47088cc36581a6a449a0fd8df1";
    hash = "sha256-T5zq4NAWx0QdHXxSoAO5eKKoMOEOM5aWzeq19PihprE=";
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
