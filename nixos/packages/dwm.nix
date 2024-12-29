{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dwm-build";
    rev = "master";
    hash = "sha256-w9e06+qw4dLg8JqfQDqAIeudT1SKogXpljBrqkxMIzE=";
  };
  buildInputs = with pkgs; [
    gcc
    gnumake
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];

  buildPhase = ''
    make all -j$(nproc)
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv dwm $out/bin/dwm
  '';
}
