{ config, ...}:
{
  programs.nixvim = {

    viAlias = true;
    vimAlias = true;
    enableMan = true;

    clipboard.register = "unnamedplus";

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;  
    };

    options = {
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
