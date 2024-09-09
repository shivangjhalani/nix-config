## LEARN NIX TwT

https://nixos.org/learn.html
https://sioodmy.dev/blog/nixos-guide/

## Basic Commands

In the dotfiles directory (The directory where this repo's flake.nix and home.nix is present)

- Rebuild system : `sudo nixos-rebuild switch --flake ./#hostname`
- Rebuild HM : `home-manager switch --flake ./#username@hostname`
- Update flake : `nix flake update`

## Structure

Inspired from https://gitlab.com/librephoenix/nixos-config which inturn is inspired from many places lol.
I prefer naming the `profile` folder there as `hosts` and I moved the `user` and `system` folder as subfolders under `modules`.

## To-Dos

> Take inspiration from : [sioodmy-dotfiles](https://github.com/sioodmy/dotfiles/tree/main)

- [x] Basic Structure
- [x] Use ZSH
- [x] Autologin
- [x] Gnome Extensions
- [x] Apps in dock
- [ ] AutoUpdate in background : [nixos-wiki-auto-updates](https://nixos.wiki/wiki/Automatic_system_upgrades)
- [ ] Custom desktop shortcuts
- [ ] Power and battery management (Have done auto-cpufreq for now)
- [ ] Dotfiles
  - [ ] Browser
  - [x] nvim
    - [x] Learn telescope
    - [ ] Setup LSP
    - [ ] Treesitter _installed, but need to configure and understand_
    - [x] LazyGit
    - [x] Clipboard
- [ ] Productivity
  - [x] fzf
  - [ ] look into `fd`, is isntalled currently
  - [x] Learn tmux (already installed, now configuration left) - [video](https://www.youtube.com/watch?v=GH3kpsbbERo) _Using kitty rn_
  - [x] nvim installed
  - [ ] ~obsidian in nvim~ :) [github](https://github.com/epwalsh/obsidian.nvim)
- [ ] Ricing
  - [ ] Nix-colors, idk if I need this when im using catppuccin
  - [ ] Terminal ricing
- [x] Virtualisation
- [ ] Managing secrets declaratively : [nix-sops](https://github.com/Mic92/sops-nix)
- [ ] Setup Comin : Git Push NixOS Machines [comin](https://github.com/nlewo/comin/tree/main)
- [ ] LD fix, Run unpatched dynamic binaries : [nix-ld](https://github.com/Mic92/nix-ld)

## Random battery checks

```
❯ upower -i /org/freedesktop/UPower/devices/battery_BAT1
  updated:              Friday 15 March 2024 11:34:55 PM (10 seconds ago)
    charge-cycles:       160
    capacity:            95.8528%
```

```
  updated:              Sunday 17 March 2024 10:53:18 PM (3 seconds ago)
    charge-cycles:       162
    capacity:            97.0377%
```

```
  updated:              Wednesday 24 July 2024 03:58:20 PM (4 seconds ago)
    charge-cycles:       240
    capacity:            94.9731%
```
