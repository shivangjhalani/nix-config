{
  programs.nixvim = {
    plugins = {
      indent-blankline = {
        enable = true;
        settings = {
          # indent.char = "▎";
          scope.enabled = false;
        };
      };
    };
  };
}
