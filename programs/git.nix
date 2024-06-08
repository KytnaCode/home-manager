{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig.credential = {
      helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
      credentialStore = "secretservice";
    };
  };

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_7}"; # dotnet 7 is required by git credential manager
  };
}
