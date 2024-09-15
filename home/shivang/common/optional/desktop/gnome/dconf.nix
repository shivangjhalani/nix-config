{...}: let
  #mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = ["obsidian.desktop" "kitty.desktop" "org.gnome.Nautilus.desktop" "vivaldi-stable.desktop"];
    };

    #"org/gnome/desktop/peripherals/mouse" = {
    #  "natural-scroll" = false;
    #  "speed" = -0.5;
    #};

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };

    #"org/gnome/desktop/screensaver" = {
    #  lock-enabled = false;
    #};

    #"org/gnome/desktop/input-sources" = {
    #  "current" = "uint32 0";
    #  "sources" = [ (mkTuple [ "xkb" "us" ]) ];
    #  "xkb-options" = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "caps:ctrl_modifier" ];
    #};

    #"org/gnome/desktop/background" = {
    #  #color-shading-type = "solid";
    #  #picture-options = "zoom";
    #  picture-uri-dark = "file://${../../../assets/wallpapers/blushed-slash.png}";
    #};
    #"org/gnome/desktop/screensaver" = {
    #  "picture-uri" = "file:///home/gvolpe/Pictures/nixos.png";
    #};

    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      # Suspend only on battery power, not while charging.
      #sleep-inactive-ac-type = "nothing";
      power-button-action = "interactive";
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-windows = ["<Alt>Tab"];
    };
    "org/gnome/shell/keybindings" = {
      toggle-message-tray = ["<Shift><Control><Alt><Super>s"];
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "kitty";
      binding = "<Control>Return";
      command = "/usr/bin/env kitty";
    };
  };
}
