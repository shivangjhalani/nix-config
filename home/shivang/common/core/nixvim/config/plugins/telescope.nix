{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      highlightTheme = "catpuccin";
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
          #sorting_strategy = "ascending";
        };
      };
    };
  };
}
