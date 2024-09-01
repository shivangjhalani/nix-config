{pkgs, ...}: {
  imports = [
    ./global
    #./features/desktop/hyprland
    ./features/nvim
  ];
}
