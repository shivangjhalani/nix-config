{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font.name = "JetBrainsMono";
    # settings writes to ~/.config/kitty/kitty.conf
    settings = {
      confirm_os_window_close = 0;
      mouse_hide_wait = "-1.0";
      window_padding_width = 2;
      background_blur = 1;
      background_opacity = "0.95";
      scrollback_lines = 10000;
      enable_audio_bell = false;
      allow_remote_control = true;
      hide_window_decorations = true;
      draw-minimal-borders = true;
    };
    #theme = "Rosé Pine Moon";
    themeFile = "Catppuccin-Mocha";
    # theme = "Catppuccin-Mocha";
    keybindings = {
      "kitty_mod+x" = "toggle_layout stack";
    };
    # extraConfig also writes the string directly to kitty.cong
    extraConfig = ''
      map kitty_mod+enter launch --cwd=current --type=window
      #map kitty_mod+t     launch --cwd=current --type=tab

      tab_bar_style		powerline
      tab_title_max_length 	18
      tab_title_template 	"{index}:{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title}"

      map f1 launch --allow-remote-control kitty +kitten broadcast
    '';
  };
}
