{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Social
    discord

    # Games
    lunar-client

    # Util
    distrobox

    # Fonts
    (nerdfonts.override { fonts = [ "AnonymousPro" ]; })

    # Development
    nodejs_20
    typescript
  ];
}
