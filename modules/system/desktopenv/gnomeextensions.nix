{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.espresso
    gnomeExtensions.vitals
    gnomeExtensions.blur-my-shell
    gnomeExtensions.hide-top-bar
    gnomeExtensions.just-perfection
    #gnomeExtensions.dash-to-dock
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
        #"caffeine@patapon.info" # USE ESPRESSO
        "blur-my-shell@aunetx"
        "hidetopbar@mathieu.bidon.ca" # MIGHT CONFLICT WITH BLUR MY SHELL
        "just-perfection-desktop@just-perfection"
        #"gsconnect@andyholmes.github.io"
	#"dash-to-dock@micxgx.gmail.com"
      ];
    };
 
    "org/gnome/shell/extensions/vitals" = {
      show-battery = false;     
      show-fan= false;
      update-time= 3;
      hot-sensors = [
        "_memory_usage_"
        "_processor_usage_"
        "__temperature_avg__"
        #"_battery_state_"
        #"_battery_rate_"
      ];
    }; 
    "org/gnome/shell/extensions/hidetopbar" = {
      enable-active-window = true;
      enable-intellihide = true;
    };
    "org/gnome/shell/extensions/espresso" = {
      show-notifications= false;
    };
    "org/gnome/shell/extensions/just-perfection" = {
      theme= true;
      show-apps-button=false;
      window-preview-caption=false;
      animation=4;
    };
  };
}

