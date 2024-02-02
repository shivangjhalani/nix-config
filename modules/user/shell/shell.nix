{ pkgs, ... }:

let

  # My shell aliases
  myAliases = {
  };

in

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    #direnv nix-direnv
  ];

  #programs.direnv = {
  #  enable = true;
  #  nix-direnv.enable = true;
  #  programs.direnv.enableBashIntegration = true;
  #};
}
