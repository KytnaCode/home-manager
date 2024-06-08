{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  dconf.settings = let 
    backgroundImage = ./Background.png;
    in {
    "org/gnome/desktop/background" = {
        "picture-uri" = "${backgroundImage}";
    };
    "org/gnome/desktop/screensaver" = {
        "picture-uri" = "${backgroundImage}";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
