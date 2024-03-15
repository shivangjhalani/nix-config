{
  programs.nixvim = {
    plugins = {
      treesitter = {
	enable = true;
	ensureInstalled = "all";
	folding = true;
	indent = true;
	nixGrammars = true;
      };
    };
  };
}
