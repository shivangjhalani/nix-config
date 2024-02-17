{ pkgs, ... }:

{
  programs.neovim = { 
    enable = true;
    defaultEditor = true;
    #vimAlias = true;

    # extraConfig : Whatever goes inside init.vim
    #extraConfig = ''
    #
    #'';
  };
}
