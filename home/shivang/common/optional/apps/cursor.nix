{ pkgs, ... }:
{
  home.packages = [
    pkgs.unstable.code-cursor
  ];
}
