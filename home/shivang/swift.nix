{
  pkgs,
  ...
}: {
  imports = [
    ./common/core

    ./common/optional/cli
    ./common/optional/desktop/common
  ];
}
