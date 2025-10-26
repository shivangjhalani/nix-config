{ pkgs, ... }:
{
  programs.opencode = {
    enable = true;
    settings = {
      theme = "catppuccin";
    };
  };
}
