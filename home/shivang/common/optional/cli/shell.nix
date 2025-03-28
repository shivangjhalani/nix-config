{
  pkgs,
  lib,
  ...
}:
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
  #programs.bash = {
  #   enable = true;
  #    enableCompletion = true;
  #    shellAliases = myAliases;
  #  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    history = {
      size = 100000;
      save = 100000;
      ignoreAllDups = true;
      ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];
    };
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;

    initExtra = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';

  };

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
    # Catpuccin
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
    # rose-pine-moon
    # colors = {
    #   fg = "#908caa";
    #   bg = "#232136";
    #   hl = "#ea9a97";
    #   "fg+" = "#e0def4";
    #   "bg+" = "#393552";
    #   "hl+" = "#ea9a97";
    #   border = "#44415a";
    #   header = "#3e8fb0";
    #   gutter = "#232136";
    #   spinner = "#f6c177";
    #   info = "#9ccfd8";
    #   pointer = "#c4a7e7";
    #   marker = "#eb6f92";
    #   prompt = "#908caa";
    # };
  };
}
