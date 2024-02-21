{ nixvim, inputs, pkgs, ...}:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim 
    ./vimconf/vim-options.nix
    #./vimconf/plugins/airline.nix
    ./vimconf/plugins/lualine.nix
    #`./vimconf/plugins/lsp.nix
    ./vimconf/plugins/telescope.nix
  ];
  
  programs.nixvim = {
    enable = true;
  };
}

