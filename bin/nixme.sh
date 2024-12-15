# NixOS configuration script
# Edits the configuration file, formats it and commits

set -e
pushd ~/dotfiles/nixos
NIX_FILE="configuration.nix"
$EDITOR $NIX_FILE
alejandra $NIX_FILE &>/dev/null
git diff -U0 *.nix
echo -e "\n[\e[93mIN PROGRESS\e[0m] Rebuilding NixOS ..."
sudo nixos-rebuild switch &> /tmp/nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
current=$(nixos-rebuild list-generations | grep current)
git commit -am "build(nixos): $current"
echo -e "\n[\e[92mDONE\e[0m] Succesfully rebuilded NixOS!"
popd
