{ ... }: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = false;
    };
    flags = [
      "--disable-up-arrow"
    ];
  };
}
