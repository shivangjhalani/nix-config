{pkgs, ...}: {
  imports = [
    ./common/core

    ./common/optional/cli
    ./common/optional/apps
    #./common/optional/desktop/hyprland
    ./common/optional/desktop/gnome
  ];
}
