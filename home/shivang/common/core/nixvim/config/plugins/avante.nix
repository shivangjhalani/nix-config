{
  programs.nixvim = {
    plugins.avante = {
      enable = true;
      settings = {
        provider = "copilot";
        copilot = {
          model = "claude-sonnet-4";
        };
        diff = {
          autojump = true;
          debug = false;
          list_opener = "copen";
        };
        highlights = {
          diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };
        };
        hints = {
          enabled = true;
        };
      };
    };
  };
}
