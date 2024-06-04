{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Latte";
    };
    themes = {
      "Catppuccin Latte" = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1";
          sha256 = "sha256-Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
        };
        file = "themes/Catppuccin Latte.tmTheme";
      };
    };
    extraPackages = with pkgs.bat-extras; [ 
      batdiff 
      batman 
      batgrep 
      prettybat
    ];
  };
}
