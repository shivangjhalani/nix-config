{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.obsidian
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
