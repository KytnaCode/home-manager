{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
