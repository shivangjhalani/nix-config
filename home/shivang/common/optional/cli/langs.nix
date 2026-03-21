{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312
    python312Packages.pip

    # nodejs_22
    # pnpm

    gcc
    cmake

    go
    rustc
  ];
}
