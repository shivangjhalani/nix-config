{
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        formatAfterSave = {
          lspFallback = true;
        };

        notifyOnError = true;
        # map of filetype to formatters

        formattersByFt = {
          # conform will run multiple formatters sequentially
          python = ["isort" "black"];
          # use a sub-list to run only the first available formatter
          javascript = [["prettierd" "prettier"]];
          # use the "*" filetype to run formatters on all filetypes.
          "*" = ["codespell"];
          # use the "_" filetype to run formatters on filetypes that don't
          # have other formatters configured.
          "_" = ["trim_whitespace"];
          go = ["gofmt" "goimports"];
          c = ["clang-format"];
          cpp = ["clang-format"];
          html = [["prettierd" "prettier"]];
          css = [["prettierd" "prettier"]];
          htmx = [["prettierd" "prettier"]];
          javascriptreact = [["prettierd" "prettier"]];
          typescript = [["prettierd" "prettier"]];
          typescriptreact = [["prettierd" "prettier"]];
          markdown = [["prettierd" "prettier"]];
          nix = ["nixfmt"];
          lua = ["stylua"];
        };
      };
    };
  };
}
