{
  pkgs ? import <nixpkgs> {}
}:

pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dwm-build";
    rev = "9c894a280444075aa0a64f6cbd1e7baf1b3084a2";
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
