{
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
	formatAfterSave = {
          lspFallback = true;
        };
        # map of filetype to formatters
        formattersByFt = {
          lua = [ "stylua" ];
          # conform will run multiple formatters sequentially
          python = [ "isort" "black" ];
          # use a sub-list to run only the first available formatter
          javascript = [ [ "prettierd" "prettier" ] ];
          # use the "*" filetype to run formatters on all filetypes.
          "*" = [ "codespell" ];
          # use the "_" filetype to run formatters on filetypes that don't
          # have other formatters configured.
          "_" = [ "trim_whitespace" ];

          # Add formatters for TypeScript
          typescript = [ "prettier" ];

          # Add formatters for Go
          go = [ "gofmt" "goimports" ];

          # Add formatters for C
          c = [ "clang-format" ];

          # Add formatters for C++
          cpp = [ "clang-format" ];

          # Add formatters for HTML
          html = [ "prettier" ];

          # Add formatters for HTMX
          htmx = [ "prettier" ];

          # Add formatters for NIX
          nix = [ "nixfmt" ];
        };
      };
    };
  };
}
