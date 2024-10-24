# NIX-CONFIG

_Started from scratch using : https://github.com/Misterio77/nix-starter-configs_

### Init

0. `nix shell nixpkgs#git`
1. `git clone https://github.com/shivangjhalani/nix-config.git`
2. `cd nix-config`
3. `export NIX_CONFIG="experimental-features = nix-command flakes"`
4. `nix shell nixpkgs#home-manager`

Rebuild Config: `sudo nixos-rebuild switch --flake .#hostname`

Home Manager: `home-manager switch --flake .#username@hostname`

---
