{ pkgs ? import <nixpkgs> {} }:

with pkgs; [
  bat
  nmap
  iputils
  fping
  sqlmap
  obsidian
]
