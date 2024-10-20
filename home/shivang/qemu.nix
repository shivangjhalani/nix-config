{pkgs, ...}: {
  imports = [
    ./common/core
    ./common/optional/cli
    ./common/optional/apps
    ./common/optional/desktop/gnome
    ./common/optional/desktop/hyprland
  ];
}
