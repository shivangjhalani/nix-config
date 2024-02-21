{ config, pkgs, ... }:

let
  unimatrix = import (builtins.fetchGit {
    url = "https://github.com/will8211/unimatrix";
    name = "unimatrix";
  }) { inherit pkgs; };
in
{
  home.packages = [
    unimatrix
  ];
}
