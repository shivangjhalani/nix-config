{

  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;
    keyMode = "vi";
    shortcut = "a";
    clock24 = true;
    extraConfig = '' 
    # used for less common options, intelligently combines if defined in multiple places. Writes directly to /etc/tmux.conf
    #set -g default-terminal "screen-256color"
    #set -ag terminal-overrides ",xterm-256color:RGB"
    #set -g allow-passthrough on
    #set-option -sg escape-time 10
    #set-option -g focus-events on
    #set-option -sa terminal-overrides ',alacritty:RGB'
    '';
  };

#  Tmux plugins can be also configured using programs.tmux.plugins. They can be found as NixOS packages: tmuxPlugins. Each of the tmux plugin is run via run-shell automatically. Some plugins need to be run after having had some custom configuration done>, but extraConfig gets executed after. For example tmuxPlugins.cpu needs the status line be declared before the plugin is run. For that scenario, run-shell can be added within extraConfig:
#
#  programs.tmux = {
#    enable = true;
#    extraConfig = ''
#      ...
#      set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
#      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
#    '';
#  }

}
