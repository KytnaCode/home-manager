{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Games
    lunar-client

    # Util
    distrobox

    # Fonts
    (nerdfonts.override { fonts = [ "AnonymousPro" ]; })
  ];
}
