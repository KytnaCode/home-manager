{ config, pkgs, lib, ... }: let
  es-dictionary = builtins.fetchurl "http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl";
  es-suggestions = builtins.fetchurl "http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug";
  fromGithub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
  readConfig = name: builtins.readFile ./plugins/${name};
  setupNoOptions = name: ''
    require("${name}").setup()
  '';
  setupEmpty = name: ''
    require("${name}").setup({})
  '';
  in
  {
  imports = [
    ./linters.nix
    ./formatters.nix
    ./lsp.nix
  ];

  home.file = {
    "${config.xdg.configHome}/nvim/spell/es.utf-8.spl".source = es-dictionary;
    "${config.xdg.configHome}/nvim/spl/es.utf-8.sug".source = es-suggestions;
  };

  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./keymaps.lua)
      (builtins.readFile ./options.lua)
      (builtins.readFile ./highlights.lua)
      (builtins.readFile ./snippets.lua)
    ];
    plugins = [
      {
        plugin = pkgs.vimPlugins.catppuccin-nvim;
        config = readConfig "catppuccin-nvim.lua";
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.fidget-nvim;
        config = readConfig "fidget-nvim.lua";
        type = "lua";
      }
      pkgs.vimPlugins.glance-nvim
      pkgs.vimPlugins.dressing-nvim
      {
        plugin = pkgs.vimPlugins.nvim-cursorline;
        config = readConfig "nvim-cursorline.lua";  
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.nvim-tree-lua;
        config = readConfig "nvim-tree-lua.lua";
        type = "lua";
      }
      pkgs.vimPlugins.nvim-web-devicons
      (fromGithub "refs/tags/0.1.8" "nvim-telescope/telescope.nvim")
      pkgs.vimPlugins.plenary-nvim
      {
        plugin = pkgs.vimPlugins.lualine-nvim;
        config = readConfig "lualine-nvim.lua";
        type = "lua";
      }
      (fromGithub "HEAD" "danilamihailov/beacon.nvim")
      {
        plugin = pkgs.vimPlugins.indent-blankline-nvim;
        config = readConfig "indent-blankline-nvim.lua";
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.alpha-nvim;
        config = readConfig "alpha-nvim.lua";
        type = "lua";
      } 
      {
        plugin = pkgs.vimPlugins.trouble-nvim;
        config = readConfig "trouble-nvim.lua";
        type = "lua";
      }
      pkgs.vimPlugins.neodev-nvim
      {
        plugin = pkgs.vimPlugins.neotest;
        config = readConfig "neotest.lua";
        type = "lua";
      }
      pkgs.vimPlugins.neotest-go
      pkgs.vimPlugins.nvim-nio
      {
        plugin = pkgs.vimPlugins.edgy-nvim;
        config = readConfig "edgy-nvim.lua";
        type = "lua";
      }
      pkgs.vimPlugins.bufdelete-nvim
      {
        plugin = pkgs.vimPlugins.toggleterm-nvim;
        config = readConfig "toggleterm-nvim.lua";
        type = "lua";
      }
      pkgs.vimPlugins.SchemaStore-nvim
      {
        plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
        config = ''
          require("nvim-treesitter.configs").setup({
            highlight = {
              enable = true,
            },
          })
        '';
        type = "lua";
      }
      pkgs.vimPlugins.vim-fugitive
      pkgs.vimPlugins.presence-nvim
      {
        plugin = pkgs.vimPlugins.persisted-nvim;
        config = readConfig "persisted-nvim.lua";
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.leap-nvim;
        config = readConfig "leap-nvim.lua";
        type = "lua";
      }
      pkgs.vimPlugins.vim-numbertoggle
      {
        plugin = pkgs.vimPlugins.bufferline-nvim;
        config = readConfig "bufferline-nvim.lua";
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.inc-rename-nvim;
        config = setupNoOptions "inc_rename";
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.gitsigns-nvim;
        config = readConfig "gitsigns-nvim.lua";
        type = "lua";
      }
      pkgs.vimPlugins.cmp-nvim-lsp
      pkgs.vimPlugins.cmp-buffer
      pkgs.vimPlugins.cmp-path
      pkgs.vimPlugins.cmp-cmdline
      pkgs.vimPlugins.cmp_luasnip
      pkgs.vimPlugins.cmp-zsh
      pkgs.vimPlugins.cmp-spell
      pkgs.vimPlugins.cmp-calc
      pkgs.vimPlugins.cmp-git
      {
        plugin = pkgs.vimPlugins.nvim-cmp;
        config = readConfig "nvim-cmp.lua";
        type = "lua";
      }
      pkgs.vimPlugins.nvim-dap
      pkgs.vimPlugins.nvim-dap-ui
      pkgs.vimPlugins.nvim-dap-go
      { 
        plugin = pkgs.vimPlugins.nvim-lspconfig;
        config = readConfig "nvim-lspconfig.lua"; # Language servers are configured in plugins/nvim-lspconfig.lua.
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.lsp_signature-nvim;
        config = setupEmpty "lsp_signature";
        type = "lua";
      }
      pkgs.vimPlugins.luasnip
      pkgs.vimPlugins.lspkind-nvim
      pkgs.vimPlugins.nvim-lsputils
      {
        plugin = pkgs.vimPlugins.nvim-lint;
        config = readConfig "nvim-lint.lua";
        type = "lua";
      }
      {
        plugin = pkgs.vimPlugins.formatter-nvim;
        config = readConfig "formatter-nvim.lua";
        type = "lua";
      }
    ];
  };
}
