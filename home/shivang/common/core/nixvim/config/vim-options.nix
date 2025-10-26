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
      # NO LONGER USING CopilotChat, USING Avante
      # {
      #   mode = "n";
      #   key = "<leader>ct";
      #   action = "<cmd>CopilotChatToggle<CR>";
      #   options = {
      #     desc = "CopilotChatToggle";
      #   };
      # }
      # {
      #   mode = "n";
      #   key = "<leader>cr";
      #   action = "<cmd>CopilotChatReset<CR>";
      #   options = {
      #     desc = "CopilotChatReset";
      #   };
      # }
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
      
      # OPENCODE
      {
        mode = ["n" "x"];
        key = "<leader>oa";
        action = "<CMD>lua require('opencode').ask('@this: ', { submit = true })<CR>";
        options.desc = "Ask about this";
      }
      {
        mode = ["n" "x"];
        key = "<leader>os";
        action = "<CMD>lua require('opencode').select()<CR>";
        options.desc = "Select prompt";
      }
      {
        mode = ["n" "x"];
        key = "<leader>o+";
        action = "<CMD>lua require('opencode').prompt('@this')<CR>";
        options.desc = "Add this";
      }
      {
        mode = "n";
        key = "<leader>ot";
        action = "<CMD>lua require('opencode').toggle()<CR>";
        options.desc = "Toggle embedded";
      }
      {
        mode = "n";
        key = "<leader>oc";
        action = "<CMD>lua require('opencode').command()<CR>";
        options.desc = "Select command";
      }
      {
        mode = "n";
        key = "<leader>on";
        action = "<CMD>lua require('opencode').command('session_new')<CR>";
        options.desc = "New session";
      }
      {
        mode = "n";
        key = "<leader>oi";
        action = "<CMD>lua require('opencode').command('session_interrupt')<CR>";
        options.desc = "Interrupt session";
      }
      {
        mode = "n";
        key = "<leader>oA";
        action = "<CMD>lua require('opencode').command('agent_cycle')<CR>";
        options.desc = "Cycle selected agent";
      }
      {
        mode = "n";
        key = "<S-C-u>";
        action = "<CMD>lua require('opencode').command('messages_half_page_up')<CR>";
        options.desc = "Messages half page up";
      }
      {
        mode = "n";
        key = "<S-C-d>";
        action = "<CMD>lua require('opencode').command('messages_half_page_down')<CR>";
        options.desc = "Messages half page down";
      }
    ];

    #extraConfigVim = ''
    #'';
  };
}
