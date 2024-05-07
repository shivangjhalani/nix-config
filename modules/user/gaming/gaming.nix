# In steam LAUNCH OPTIONS, add `gamemoderun %command%`, `mangohud %command%`, `gamescope %command%`
{pkgs, ...}: {
  # Main
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  environment.systemPackages = with pkgs; [
    prismlauncher
    protonup
    mangohud
    bottles #Run in bottles, simulate windows :)
  ];

  # For protonup
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode = {
    enable = true;
  };
}
