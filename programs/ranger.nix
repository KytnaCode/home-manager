{ ... }: {
  programs.ranger = {
    enable = true;
    plugins = [
      {
        name = "ranger-archives";
        src = builtins.fetchGit {
          url = "https://github.com/maximtrp/ranger-archives.git";
          rev = "b4e136b24fdca7670e0c6105fb496e5df356ef25";
        };
      } 
    ];
  };
}
