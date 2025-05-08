{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
      # keymaps = {
      #   addFile = "<leader>ha";
      #   navFile = {
      #     "1" = "<leader>h1";
      #     "2" = "<leader>h2";
      #     "3" = "<leader>h3";
      #     "4" = "<leader>h4";
      #     "5" = "<leader>h5";
      #     "6" = "<leader>h6";
      #     "7" = "<leader>h7";
      #     "8" = "<leader>h8";
      #   };
      #   toggleQuickMenu = "<leader>hh";
      # };
    };
  };
}
