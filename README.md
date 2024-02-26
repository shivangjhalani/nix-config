## LEARN NIX TwT
https://nixos.org/learn.html

## Basic Commands
In the dotfiles directory (The directory where this repo's flake.nix and home.nix is present)
- Update flakes : `nix flake update`
- Rebuild system : `sudo nixos-rebuild switch --flake ./#hostname`
- Rebuild HM : `home-manager switch --flake ./#username@hostname`
- Update flake : `nix flake update`

## Structure
Inspired from https://gitlab.com/librephoenix/nixos-config which inturn is inspired from many places lol.
I prefer naming the `profile` folder there as `hosts` and I moved the `user` and `system` folder as subfolders under `modules`.

## To-Dos
- [x] Basic Structure
- [x] Use ZSH
- [x] Autologin
- [x] Gnome Extensions
- [x] Apps in dock
- [ ] Custom desktop shortcuts
- [ ] Power and battery management (Have done auto-cpufreq for now)
- [ ] Dotfiles
  - [ ] Browser
  - [x] nvim
    - [x] Learn telescope
    - [ ] Setup LSP
    - [ ] LazyGit
    - [ ] Clipboard
- [ ] Productivity
  - [x] fzf
  - [ ] look into `fd`, is isntalled currently
  - [ ] Learn tmux (already installed, now configuration left) - [video](https://www.youtube.com/watch?v=GH3kpsbbERo) _Using kitty rn_
  - [x] nvim installed
  - [ ] Obsidian in nvim :) [github](https://github.com/epwalsh/obsidian.nvim)
- [ ] Ricing
  - [ ] Nix-colors, idk if I need this when im using catppuccin
  - [ ] Terminal ricing
- [x] Virtualisation
- [ ] Managing secrets declaratively : [nix-sops](https://github.com/Mic92/sops-nix)

