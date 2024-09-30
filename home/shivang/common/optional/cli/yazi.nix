#THEMES DONT WORK RN, JUST COPY THE yaz-config FOLDER TO ~/.config/yazi
{
  programs.yazi = {
    enable = true;
    flavors = {
      #catppuccin-mocha = ./yazi/flavors/catppuccin-mocha.yazi;
      # foo = ./foo;
      # bar = pkgs.bar;
    };
    settings = {
      theme = {
        #catppuccin = ./yazi/theme.toml;
        #rose-pine = ./yazi/rose-pine-theme.toml;
      };
    };
  };
}
