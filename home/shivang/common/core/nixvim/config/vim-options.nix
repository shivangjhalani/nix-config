{
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;

    clipboard.register = "unnamedplus";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };
    # colorschemes.rose-pine = {
    #   enable = true;
    #   settings = {
    #     variant = "auto";
    #     dark_variant = "moon";
    #     dim_inactive_windows = true;
    #     extend_background_behind_borders = true;
    #
    #     styles = {
    #       bold = true;
    #       italic = true;
    #       transparency = true;
    #     };
    #   };
    # };

    opts = {
      updatetime = 100; # Faster completion

      # UI
      number = true;
      relativenumber = true;

      # Folding
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldenable = false; # Disable folding by default
      foldlevel = 99; # Open all folds by default

      # Indentation
      autoindent = true;
      smartindent = true;
      shiftwidth = 2;
      softtabstop = 2;
      tabstop = 2;
      expandtab = true;

      scrolloff = 8; # stay-centered

      # Performance
      shell = "zsh";
      lazyredraw = true;

      # Search
      ignorecase = true;
      incsearch = true;
      smartcase = true;
      wildmode = "list:longest";

      # Misc
      swapfile = false;
      undofile = true; # Build-in persistent undo
      wrap = false;
      list = true;
      listchars = {
        tab = "» ";
        #tab = "▎";
        trail = "·";
        nbsp = "␣";
      };
    };

    globals = {
      mapleader = ";";
      maplocalleader = ";";

      have_nerd_font = true;
    };

    keymaps = [
      {
        key = "<leader>fm";
        action = "<CMD>lua vim.lsp.buf.format({ async = true})<CR>";
        options.desc = "Format the current file";
      }

      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      {
        mode = "v";
        key = "<leader>p";
        action = "\"_dP";
        options = {
          silent = true;
          noremap = true;
          desc = "Delete into black hole and paste";
        };
      }
      {
        mode = "n";
        key = "<leader>dd";
        action = "\"_dd";
        options = {
          silent = true;
          noremap = true;
          desc = "Delete line to black hole in normal mode";
        };
      }
      {
        mode = "v";
        key = "<leader>dd";
        action = "\"_d";
        options = {
          silent = true;
          noremap = true;
          desc = "Delete selection to black hole in visual mode";
        };
      }
      {
        mode = "n";
        key = "<leader>ct";
        action = "<cmd>CopilotChatToggle<CR>";
        options = {
          desc = "CopilotChatToggle";
        };
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>CopilotChatReset<CR>";
        options = {
          desc = "CopilotChatReset";
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
    ];

    #extraConfigVim = ''
    #'';
  };
}
