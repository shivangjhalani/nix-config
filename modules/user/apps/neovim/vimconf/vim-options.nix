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
  };
}
