{ lib, ... }:

let
  #mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {

    #"org/gnome/shell" = {
    #    disable-user-extensions = false;
    #    disabled-extensions = [ ];
    #    enabled-extensions = [
    #      #"native-window-placement@gnome-shell-extensions.gcampax.github.com"
    #      #"pop-shell@system76.com"
    #      "caffeine@patapon.info"
    #      "hidetopbar@mathieu.bidon.ca"
    #      #"gsconnect@andyholmes.github.io"
    #    ];
    #};
    #"org/gnome/shell/extensions/hidetopbar" = {
    #    enable-active-window = false;
    #    enable-intellihide = true; 
    #};

    #"org/gnome/desktop/peripherals/mouse" = {
    #  "natural-scroll" = false;
    #  "speed" = -0.5;
    #};

    "org/gnome/desktop/peripherals/touchpad" = {
      "tap-to-click" = true;
      "two-finger-scrolling-enabled" = true;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };

    #"org/gnome/desktop/input-sources" = {
    #  "current" = "uint32 0";
    #  "sources" = [ (mkTuple [ "xkb" "us" ]) ];
    #  "xkb-options" = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "caps:ctrl_modifier" ];
    #};

    "org/gnome/desktop/background" = {
      #color-shading-type = "solid";
      #picture-options = "zoom";
      picture-uri-dark = "file://${../../../assets/wallpapers/Blobs-gnome.png}";
    };
    #"org/gnome/desktop/screensaver" = {
    #  "picture-uri" = "file:///home/gvolpe/Pictures/nixos.png";
    #};

    "org/gnome/mutter" = {
      edge-tiling = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      # Suspend only on battery power, not while charging.
      #sleep-inactive-ac-type = "nothing";
      power-button-action = "interactive";
    };

    #"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {      
      #name = "Terminal";
      #binding = "<Super>Return";
      #command = "/usr/bin/env kgx";
    #};
  };
}

