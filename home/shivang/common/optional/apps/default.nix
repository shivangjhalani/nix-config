{
  pkgs,
  config,
  ...
}: {
  imports = [
    #./deluge.nix
    #./discord.nix
    #./dragon.nix
    ./firefox.nix
    ./kitty.nix
    ./obsidian.nix
    ./vlc.nix
		./vivaldi.nix
    #./font.nix
    #./gtk.nix
    #./kdeconnect.nix
    #./pavucontrol.nix
    #./playerctl.nix
    #./qt.nix
    #./sublime-music.nix
  ];

}
