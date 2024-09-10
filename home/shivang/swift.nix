{
  pkgs,
  ...
}: {
  imports = [
    ./common/core

    ./common/optional/cli
    ./common/optional/desktop/common
    #./common/optional/desktop/hyprland
  ];
}
