{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = "catppuccin";
        };
      };
    };
  };
}
