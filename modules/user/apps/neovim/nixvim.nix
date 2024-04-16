{ nixvim, inputs, pkgs, ...}:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim 

		# vim stiff
    ./vimconf/vim-options.nix
    ./vimconf/keymaps.nix

		# ui
    ./vimconf/plugins/ui/lualine.nix
		./vimconf/plugins/ui/indent-blankline.nix

		# lsp
    ./vimconf/plugins/lsp/lsp.nix
    ./vimconf/plugins/lsp/none-lsp.nix
		#./vimconf/plugins/lsp/conform.nix
    ./vimconf/plugins/lsp/nvim-cmp.nix

		# utils
    ./vimconf/plugins/utils/telescope.nix
    #./vimconf/plugins/utils/ufo.nix
    ./vimconf/plugins/utils/autoclose.nix

		# treesitter
    ./vimconf/plugins/treesitter/treesitter.nix


    #./vimconf/plugins/obsidian-nvim.nix
  ];
  
  programs.nixvim = {
    enable = true;
  };

  # TO ENABLE CLIPBOARD SUPPORT :)
  home.packages = [
    pkgs.wl-clipboard
  ];
}

