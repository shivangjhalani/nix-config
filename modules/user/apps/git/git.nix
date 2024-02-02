{ config, pkgs, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "shivangjhalani";
  programs.git.userEmail = "shivang2004jhalani@gmail.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}
