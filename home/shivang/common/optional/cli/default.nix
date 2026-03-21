{ pkgs, ... }:
{
  imports = [
    ./gh.nix
    ./git.nix
    ./shell.nix
    ./starship.nix
    ./yazi.nix
    ./neofetch.nix
    ./langs.nix
    ./zoxide.nix
    ./opencode.nix
    ./claudecode.nix
    ./amp-cli.nix
    ./gemini-cli.nix
    ./codex.nix
    ./eza.nix
  ];
  home.packages = [
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

    pkgs.nixd # Nix LSP
    pkgs.alejandra # Nix formatter
    pkgs.nixfmt-rfc-style
    pkgs.nvd # Differ
    pkgs.nix-diff # Differ, more detailed
    pkgs.nix-output-monitor
    # pkgs. # nh # Nice wrapper for NixOS and HM

    # pkgs. # zsh
    # pkgs. # fzf
    # pkgs. # bat
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.tree
    pkgs.fd
    pkgs.figlet
    pkgs.lolcat
    pkgs.cowsay
    pkgs.unzip
    pkgs.gnumake
    pkgs.wget
    pkgs.unstable.devenv

    pkgs.openvpn
    pkgs.sshpass
    pkgs.lsof

    pkgs.jq
    pkgs.uv

    pkgs.nix-index

    #ltex-ls # Spell checking LSP
  ];
}
