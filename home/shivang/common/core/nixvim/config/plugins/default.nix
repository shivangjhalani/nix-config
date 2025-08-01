{pkgs, ...}: {
  imports = [
    ./lsp
    ./cmp

    #./lazy.nix
    ./treesitter.nix
    ./fugitive.nix
    ./telescope.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./wilder.nix
    ./whichkey.nix
    ./toggleterm.nix
    ./harpoon.nix
    ./neotree.nix
    ./webdevicons.nix
    # ./copilot.nix
    ./stay-centered.nix
    ./undrotree.nix
    ./avante.nix
    # ./neoscroll.nix
  ];
}
