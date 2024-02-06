{ config, pkgs, lib, ... }:

with lib;


let

  
  # My shell aliases
  myAliases = {
    #cat = "bat";
  };


in

{

  imports = [
    ./tmux.nix
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
#    initExtra = ''
#      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#    '';
#    zplug = {
#      enable = true;
#      plugins = [{
#        name = "romkatv/powerlevel10k";
#        tags = [ "as:theme" "depth:1" ];
#      }];
#    };
  };

  home.packages = with pkgs; [
    direnv nix-direnv
    ranger
    zsh
    fzf
    bat
    ripgrep
    #fd Unnamed dependency of fzf?
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--reverse"
      #"--multi" DOESNT WORK TwT
      "--height 50%"
      "--border"
      "--preview-window 'right:60%'"
      "--preview 'bat --color=always --style=header,grid --line-range :300 {}'" 
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
}
