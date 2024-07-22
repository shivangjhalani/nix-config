{pkgs, ...}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.package = pkgs.bluez;
}
