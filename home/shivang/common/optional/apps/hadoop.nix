{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hadoop_3_4
  ];
}

