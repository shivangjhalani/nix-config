{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings.ensure_installed = "all";
        folding = true;
        settings.indent.enable = true;
        nixGrammars = true;
      };
    };
  };
}
