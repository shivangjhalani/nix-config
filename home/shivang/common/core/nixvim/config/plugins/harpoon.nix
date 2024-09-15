{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
      keymaps = {
        addFile = "<leader>ha";
        navFile = {
          "1" = "<leader>h1";
          "2" = "<leader>h2";
          "3" = "<leader>h3";
          "4" = "<leader>h4";
        };
        #toggleQuickMenu = "<leader>hh";
      };
    };
  };
}
