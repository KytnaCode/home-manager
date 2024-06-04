{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    selene # Lua linter
    golangci-lint # Go linter
    vim-vint # Vimscript linter
    shellcheck # Shell linter
    shellharden # Shell linter
    eslint_d # Javascript & Typescript linter
  ];
}
