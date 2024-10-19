{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = [
      pkgs.mpvScripts.mpris
      pkgs.mpvScripts.modernx-zydezu
      pkgs.mpvScripts.autoload
      pkgs.mpvScripts.mpv-playlistmanager
    ];
    config = {
      osd-font-size = 16;
      save-position-on-quit = "yes";
    };
  };
}

# mpris allows mpv to be controlled by normal media keys, in gnome settings, set keyboard shortcut for play pause, mine i scurrently super + k
# using terminal go to course folder and run mpv --save-position-on-quit . to open the course.
