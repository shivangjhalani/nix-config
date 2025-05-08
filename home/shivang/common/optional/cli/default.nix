{pkgs, ...}: {
  imports = [
    ./gh.nix
    ./git.nix
    ./shell.nix
    ./starship.nix
    ./yazi.nix
    ./neofetch.nix
    ./langs.nix
  ];
  home.packages = with pkgs; [
    #comma # Install and run programs by sticking a , before them
    #distrobox # Nice escape hatch, integrates docker images with my environment

    #bc # Calculator
    #bottom # System viewer
    #ncdu # TUI disk usage
    #eza # Better ls
    #fd # Better find
    #httpie # Better curl
    #diffsitter # Better diff
    #jq # JSON pretty printer and manipulator
    #trekscii # Cute startrek cli printer
    #timer # To help with my ADHD paralysis

    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt-rfc-style
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    #nh # Nice wrapper for NixOS and HM

    #zsh
    #fzf
    #bat
    ripgrep
    tree
    fd
    figlet
    lolcat
    cowsay
    unzip

    #ltex-ls # Spell checking LSP
  ];
}
