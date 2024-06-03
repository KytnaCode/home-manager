{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "edvardm";
      plugins = [
        "colorize"
        "common-aliases"
        "docker"
        "docker-compose"
        "git"
        "gitignore"
        "gnu-utils"
        "golang"
        "gpg-agent"
        "gradle"
        "man"
        "mvn"
        "nmap"
        "node"
        "npm"
        "podman"
        "sbt"
        "scala"
        "sudo"
        "systemd"
        "tmux"
        "z"
        ];
    };
  };  
}
