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

    opts = {
      updatetime = 100; # Faster completion

      # UI
      number = true;
      relativenumber = true;

      # Folding
      foldenable = false;
      foldmethod = "expr";
      #foldexpr= "v:lua.vim.treesitter.foldexpr()";
      #foldtext = "v:lua.vim.treesitter.foldtext()";

      # Indentation
      autoindent = true;
      smartindent = true;
      shiftwidth = 2;
      softtabstop = 2;
      tabstop = 2;
      expandtab = true;

      scrolloff = 8;

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
        trail = "·";
        nbsp = "␣";
      };
    };

    globals = {
      mapleader = ";";
      maplocalleader = ";";

      have_nerd_font = false;
    };

    keymaps = [
      {
        # Format file
        key = "<leader>fm";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format the current buffer";
      }
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
    ];

    #extraConfigVim = ''
    #'';
  };
}
