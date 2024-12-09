{ pkgs ? import <nixpkgs> {} }:

with pkgs; [
  # Cli Tools
  obsidian
  xclip
  curl
  feh
  jq
  picom
  fd
  ripgrep
  fzf
  tmux
  wireguard-tools
  openvpn
  git

  # Libraries*
  texliveFull

  # Screenshot
  flameshot
  peek

  # Apps
  zathura
  vim
  neovim
  syncthing
  nyxt
  keepassxc

  # Programming
  gnumake
  cargo
  rustup
  go
  jdk23
  jdk17
  jdk11
  jdk8
]

  
