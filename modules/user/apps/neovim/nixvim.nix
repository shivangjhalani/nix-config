{ nixvim, inputs, pkgs, ...}:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim 
    ./vimconf/vim-options.nix
    #./vimconf/plugins/airline.nix
    ./vimconf/plugins/lualine.nix
    #`./vimconf/plugins/lsp.nix
    ./vimconf/plugins/telescope.nix
    ./vimconf/plugins/autoclose.nix
    ./vimconf/plugins/indent-blankline.nix
    ./vimconf/plugins/treesitter.nix
    #./vimconf/plugins/obsidian-nvim.nix
    #./vimconf/plugins/ufo.nix #Will setup after lsp and stuff
  ];
  
  programs.nixvim = {
    enable = true;
  };

  # TO ENABLE CLIPBOARD SUPPORT :)
  home.packages = [
    pkgs.wl-clipboard
  ];
}

