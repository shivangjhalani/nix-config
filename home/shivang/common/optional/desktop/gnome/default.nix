{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./gnomeextensions.nix
    ./dconf.nix
  ];
}
