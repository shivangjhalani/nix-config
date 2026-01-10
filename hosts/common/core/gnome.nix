{ pkgs, ... }:
{

  # Pre 25.11
  # services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # # As of 25.11
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = false;

  # services.gnome.gnome-remote-desktop.enable = true;
  # environment.systemPackages = with pkgs; [
  #   gnome-remote-desktop
  # ];
  # systemd.services.gnome-remote-desktop = {
  #   wantedBy = [ "default.target" ];
  #   unitConfig.ConditionUser = "!@system";
  # };
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];
}
