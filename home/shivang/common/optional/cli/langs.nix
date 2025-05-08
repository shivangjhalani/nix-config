{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312Full
    python312Packages.pip

    nodejs_22

    gcc
    cmake
  ];
}
