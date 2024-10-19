inputs:
{ pkgs, ... }:

{
  environment.systemPackages = with inputs.nix-alien.packages.${pkgs.system}; [
    nix-alien
  ];

  # Optional, needed for `nix-alien-ld`
  programs.nix-ld.enable = true;
}
