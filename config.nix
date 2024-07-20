{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.npm-packages/bin"
  ];

  home.file.".npmrc".text = "prefix = \${HOME}/.npm-packages";

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
    NODE_PATH = "$HOME/.npm-packages/lib/node_modules";
  };
}
