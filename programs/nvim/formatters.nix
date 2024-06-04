{ pkgs, ... }: {
  home.packages = with pkgs; [
    stylua # Lua formatter
    golines # Go formatter
    gotools # Go imports comes from this package
    beautysh # Shell formatter
    eslint_d # Javascript & Typescript formatter
    prettierd # Javascript & Typescript formatter
  ];
}
