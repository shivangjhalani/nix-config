{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<leader>tt]]";
      };
    };
  };
}
