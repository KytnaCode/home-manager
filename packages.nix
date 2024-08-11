{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Social
    discord

    # Games
    lunar-client

    # Personal & Organization
    obsidian

    # Util
    distrobox
    moreutils

    # Fonts
    (nerdfonts.override { fonts = [ "AnonymousPro" ]; })

    # Development
    nodejs_20
    typescript
    mongosh
  ];
}
