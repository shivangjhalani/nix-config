{
  config,
  lib,
  user,
  ...
}:
with lib; let
  cfg = config.d.auto-login;
in {
  options.d.auto-login = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    services.displayManager.autoLogin = {
      enable = true;
      user = "shivang";
    };

    # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
  };
}
