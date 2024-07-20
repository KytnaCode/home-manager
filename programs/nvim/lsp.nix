{ pkgs, ... }: {
  # Required Language Servers
  home.packages = with pkgs; [
    lua-language-server
    nodePackages_latest.vscode-json-languageserver # JSON
    yaml-language-server
    gopls # Go
    dockerfile-language-server-nodejs # Dockerfile
    docker-compose-language-service
    vim-language-server # Vimscript
    nodePackages_latest.bash-language-server
    nodePackages_latest.typescript-language-server
    vscode-langservers-extracted # CSS
    tailwindcss-language-server
    nixd

    ripgrep # required by telescope live grep
];
}
