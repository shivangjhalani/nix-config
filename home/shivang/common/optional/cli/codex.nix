{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unstable.codex
  ];
}
