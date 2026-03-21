{ pkgs, ... }:
{
  programs.eza = {
    enable = true;
    colors = "always";
    enableZshIntegration = true;
    git = true;
    icons = "never";
    extraOptions = [
      "--all"
      "--tree"
      "--level=1"
      "--group-directories-first"
    ];
    theme = "rose-pine";
  };
}
