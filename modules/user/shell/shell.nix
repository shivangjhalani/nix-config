{ config, pkgs, lib, ... }:

with lib;

let
  # My shell aliases
  myAliases = {
    #cat = "bat";
    v = "nvim";
    c = "clear";
  };

in
{
  imports = [
    ./tmux.nix
    #./alacritty.nix
    ./kitty.nix
    ./font.nix
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    #enableAutosuggestions = true;
    enableCompletion = true;
    history = {
      size = 100000;
      save = 100000;
    };
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = [ 
      		  "git" 
                  "colored-man-pages" 
                  #"zsh-nix-shell"
		];
    };
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
		tree
		fd
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
