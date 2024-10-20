{ pkgs, ... }:
let
  # flake-compat = builtins.fetchTarball {
  #   url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  #   sha256 = "0m9grvfsbwmvgwaxvdzv6cmyvjnlww004gfxjvcl806ndqaxzy4j";
  # };
  # hyprland =
  #   (import flake-compat {
  #     src = builtins.fetchTarball {
  #       url = "https://github.com/hyprwm/Hyprland/archive/main.tar.gz";
  #       sha256 = "18mwa02mljdj9birphzck4i8lfqhf7zkgwmmww3n6xlwph2q0cxc";
  #     };
  #   }).defaultNix;
in
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  programs.hyprland = {
    enable = true;
    # # set the flake package
    # package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # # make sure to also set the portal package, so that they are in sync
    # portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
