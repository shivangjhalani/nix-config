## LEARN NIX TwT
https://nixos.org/learn.html

## Basic Commands
In the dotfiles directory (The directory where this repo's flake.nix and home.nix is present)
- Update flakes : `nix flake update`
- Rebuild system : `sudo nixos-rebuild switch --flake ./#hostname`
- Rebuild HM : `home-manager switch --flake ./#username@hostname`

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
- [ ] [x] Power and battery management
- [ ] Dotfiles
  - [ ] Browser
  - [ ] nvim
  - [ ] Terminal ricing
- [ ] Nix-colors and ricing
- [ ] Virtualisation
