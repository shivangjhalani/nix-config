{ config, ...}:
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
      fileencoding = "utf-8";

      # UI
      number = true;
      relativenumber = true;

      # Folding
      foldenable = false;
      foldmethod = "expr";
      #foldexpr= "v:lua.vim.treesitter.foldexpr()";
      #foldtext = "v:lua.vim.treesitter.foldtext()";

      # Indentation
      shiftwidth = 2;
			softtabstop = 2;
      tabstop = 2;
			expandtab = true;

      # Performance
      shell = "zsh";
      lazyredraw = true;

      # Misc
      wrap = false;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraConfigVim = ''
    '';
  };
}
