{
  programs.nixvim = {
    plugins = {
      indent-blankline = {
      enable = true;
      extraOptions = {
	indent.char = "▎";
	scope.enabled = false;
      };
      };
    };
  };
}
