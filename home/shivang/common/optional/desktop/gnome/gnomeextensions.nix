{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-extension-manager
    gnome-tweaks

    # GNOME APPS
    gnome-podcasts
    resources
    gnome-solanum

    gnomeExtensions.espresso
    gnomeExtensions.vitals
    gnomeExtensions.blur-my-shell
    gnomeExtensions.hide-top-bar
    gnomeExtensions.just-perfection
    #gnomeExtensions.dash-to-dock
    #gnomeExtensions.pano
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.cronomix
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "disabled" ];
      enabled-extensions = [
        #"native-window-placement@gnome-shell-extensions.gcampax.github.com"
        #"pop-shell@system76.com"
        "Vitals@CoreCoding.com"
        #"ddterm@amezin.github.com"
        "espresso@coadmunkee.github.com"
        "blur-my-shell@aunetx"
        "hidetopbar@mathieu.bidon.ca"
        "just-perfection-desktop@just-perfection"
        #"gsconnect@andyholmes.github.io"
        #"dash-to-dock@micxgx.gmail.com"
        #"pano@elhan.io"
        "appindicatorsupport@rgcjonas.gmail.com"
        "rounded-window-corners@fxgn"
        "clipboard-indicator@tudmotu.com"
        "cronomix@zagortenay333"
      ];
    };

    "org/gnome/shell/extensions/vitals" = {
      show-battery = true;
      show-fan = false;
      update-time = 3;
      hot-sensors = [
        "_memory_usage_"
        "_processor_usage_"
        "__temperature_avg__"
        "_battery_rate_"
      ];
    };
    "org/gnome/shell/extensions/hidetopbar" = {
      enable-active-window = true;
      enable-intellihide = true;
    };
    "org/gnome/shell/extensions/espresso" = {
      show-notifications = false;
    };
    "org/gnome/shell/extensions/just-perfection" = {
      theme = true;
      show-apps-button = false;
      window-preview-caption = false;
      animation = 4;
    };
    # "org/gnome/shell/extensions/pano" = {
    #   history-length = 50;
    #   play-audio-on-copy = false;
    #   send-notification-on-copy = false;
    #   show-indicator = false;
    #   global-shortcut = [ "<Super>v" ];
    # };
    "org/gnome/shell/extensions/clipboard-indicator" = {
      cache-size = 100;
      history-size = 100;
      toggle-menu = [ "<Super>v" ];
    };
  };
}
