{pkgs, ...}: {
  imports = [
    ./global
    #./features/desktop/hyprland
    ./features/nvim
    ./features/desktop/common
  ];
}
