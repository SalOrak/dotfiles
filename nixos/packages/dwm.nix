{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";
  src = pkgs.fetchFromGitHub {
    owner = "salorak";
    repo = "dwm-build";
    rev = "c5502fb3fa5a7707d1e70c35df87f75da5c9e678";
    hash = "sha256-tdAGJ8HzwrLELJp07XVoItg1B9vUssZhvumKbz5+1sM=";
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
