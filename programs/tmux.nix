{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    prefix = "C-a";
    resizeAmount = 10;
    shell = "${pkgs.zsh}/bin/zsh";
    tmuxinator.enable = true;
    plugins = [ 
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'latte'";
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = "set -g @continuum-boot 'on'";
      }
      pkgs.tmuxPlugins.fingers
      pkgs.tmuxPlugins.pain-control
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.tilish
    ];
  };
}
