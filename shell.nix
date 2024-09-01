{pkgs ? import <nixpkgs> {}, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes ca-derivations";
    nativeBuildInputs = with pkgs; [
      nix
      neovim
      home-manager
      git
      tree
      ripgrep

      sops
      ssh-to-age
      gnupg
      age
    ];
  };
}
