# Basic Commands
In the dotfiles directory (The directory where this repo's flake.nix and home.nix is present)
- Update flakes : `nix flake update`
- Rebuild system : `sudo nixos-rebuild switch --flake ./#hostname`
- Rebuild HM : `home-manager switch --flake ./#username@hostname`

# Structure
Inspired from https://gitlab.com/librephoenix/nixos-config which inturn is inspired from many places lol.
