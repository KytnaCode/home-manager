{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    # Games
    lunar-client

    # Util
    distrobox
  ];
}
