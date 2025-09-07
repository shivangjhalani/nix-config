{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312Full
    python312Packages.pip

    nodejs_22
    pnpm

    gcc
    cmake

    go
    rustc
  ];
}
