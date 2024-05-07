{
  pkgs,
  lib,
  ...
}:
with lib; let
  # My shell aliases
  myAliases = {
    #cat = "bat";
    v = "nvim";
    c = "clear";
  };
in {
  imports = [
    ./tmux.nix
    #./alacritty.nix
    ./kitty.nix
    ./font.nix
    ./starship.nix
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    history = {
      size = 100000;
      save = 100000;
    };
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    # Directly using HM plugins option instead of OMZ
    #plugins = [
    #	{
    #		name = "powerlevel10k";
    #		src = pkgs.zsh-powerlevel10k;
    #		file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #	}
    #];
  };

  home.packages = with pkgs; [
    direnv
    nix-direnv
    ranger
    zsh
    #fzf
    #bat
    ripgrep
    tree
    fd
  ];

  programs.bat = {
    enable = true;
    themes = {
      Catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
    config = {
      theme = "Catppuccin-mocha";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--reverse"
      #"--multi" DOESNT WORK TwT
      "--height 50%"
      "--border"
      "--preview-window 'right:60%'"
      #"--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
      #"--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
      #"--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
      #"--preview 'bat --color=always --style=header,grid --line-range :300 {}'"
    ];
    colors = {
      "bg+" = "#313244";
      bg = "#1e1e2e";
      spinner = "#f5e0dc";
      hl = "#f38ba8";

      fg = "#cdd6f4";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";

      marker = "#f5e0dc";
      "fg+" = "#cdd6f4";
      prompt = "#cba6f7";
      "hl+" = "#f38ba8";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
}
