{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
  }; 

  xdg.configFile."kitty".source = ./kitty;
}
