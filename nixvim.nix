{ config, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
        {
          key = "<leader>cd";
          action = "<cmd>Ex<CR>";
          mode = "n";
        }
    ];
    
    colorschemes = {
     # catppuccin = {
     #    enable = true;
     #    settings = {
     #        flavour = "mocha";
     #    };
     # };

     # gruvbox.enable = true;

     nord.enable = true;
    };
     

    plugins.treesitter = {
      enable = true;
    };

    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };

    plugins.lsp = {
      enable = true;
      servers = {
        texlab.enable = true;
        nil_ls.enable = true;
        lua_ls.enable = true; 
        pyright.enable = true;
        rust_analyzer.installCargo.enable = true;
        bashls.enable = true;
        cmake.enable = true;
        eslint.enable = true;
        html.enable = true;
        marksman.enable = true;
        yamlls.enable = true;
      };
     };

    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fd" = "diagnostics";
      };
    };

    plugins.vimtex = {
      enable = true;
      settings = {
        view_method = "zathura";
        compiler_method = "latexmk";
        compiler_latexmk = {
          continuous = 1;
          options = [
            "-pdf"
            "-synctex=1"
          ];
        };
      };
    };    

    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          alwaysDivideMiddle = true;
          globalstatus = true;
          icons_enabled = true;
          component_separators = {
            left = "";
            right = "";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" "diagnostics" ];
          lualine_c = [ "filename" ];
          lualine_x = [ "fileformat" "filetype" ];
        };
      };
    };

    plugins.alpha = {
      enable = true;
      theme = "startify";
    };

    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      shiftwidth = 4;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = true;
      swapfile = false;
      backup = false;
      hlsearch = true;
      incsearch = true;
      termguicolors = true;
      linebreak = true;
      smartcase = true;
      scrolloff = 4;
      sidescrolloff = 4;
      splitbelow = true;
      splitright = true;
      numberwidth = 4;
      pumheight = 10;
      conceallevel = 0;
      signcolumn = "yes";
      cmdheight = 0;
      breakindent = true;
      updatetime = 50;
      timeoutlen = 300;
      undofile = true;
      encoding = "utf-8";
      fileencoding = "utf-8";            
    };

    plugins.noice.enable = true;
    plugins.none-ls.enable = true;
    plugins.comment.enable = true;
    plugins.gitsigns.enable = true;
    plugins.orgmode.enable = true;
    plugins.indent-blankline.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.fugitive.enable = true;
    plugins.which-key.enable = true;
    plugins.colorizer.enable = true;            
    plugins.web-devicons.enable = true;
    plugins.cmp-vsnip.enable = true;
    plugins.presence.enable = true;
  };

}
