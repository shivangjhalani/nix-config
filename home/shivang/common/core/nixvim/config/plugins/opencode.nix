{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.opencode-nvim
    ];
  };
}
