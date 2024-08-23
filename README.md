# NIX-CONFIG

## _Started from scratch from : https://github.com/Misterio77/nix-starter-configs_

### Init

0. `nix shell nixpkgs#git`
1. `git clone https://github.com/shivangjhalani/nix-config.git`
2. `cd nix-config`
3. `export NIX_CONFIG="experimental-features = nix-command flakes"`
4. `cat /etc/nixos/hardware-configuration.nix > nixos/hardware-configuration.nix`
5. Make changes in username and hostname as required in `flake.nix`, `configuration.nix` and `home.nix`.
6. `nix shell nixpkgs#home-manager`

Rebuild Config: `sudo nixos-rebuild switch --flake .#hostname`
Home Manager: `home-manager switch --flake .#username@hostname`

---

### Features

- [ ] Hello
