{
  pkgs,
  ...
}: {
  imports = [
    ./global
    #./features/neovim
    #./features/desktop/hyprland
  ];
}
