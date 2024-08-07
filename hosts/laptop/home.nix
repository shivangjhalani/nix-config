{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # UserLevel

    ../../modules/user/shell/shell.nix
    #../../modules/user/apps/neovim/nvim.nix
    ../../modules/user/apps/neovim/nixvim.nix
    #../../modules/user/apps/vscode/vscode.nix
    ../../modules/user/apps/git/git.nix
    #../../modules/user/apps/spicetify/spicetify.nix
    ../../modules/user/apps/firefox/firefox.nix
    #../../modules/user/apps/nextcloud/nextcloud.nix
    #../../modules/user/apps/unimatrix/unimatrix.nix
    ../../modules/user/apps/lazygit/lazygit.nix
    ../../modules/user/apps/btop/btop.nix
    ../../modules/user/apps/espanso/espanso.nix
    #../../modules/user/apps/lf/lf.nix
    #../../modules/user/apps/obsidian/obsidian.nix  #Added in configuration.nix

    # SystemLevel
    #../../modules/system/desktopenv/gnomesettings-hm.nix #ADDED IN CONFIGURATION.NIX
    ../../modules/system/desktopenv/dconf.nix
    ../../modules/system/desktopenv/gtk.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sjay";
  home.homeDirectory = "/home/sjay";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Core
    #pkgs.git
    #pkgs.firefox
    #pkgs.neovim
    #pkgs.alacritty
    #pkgs.powertop
    pkgs.normcap
    pkgs.vlc
    pkgs.telegram-desktop
    pkgs.spotify
    pkgs.zoom-us

    # Apps

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    #
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sjay/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
