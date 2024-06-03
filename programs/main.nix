{ config, pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./kitty/kitty.nix
  ];
}
