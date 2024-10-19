{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    extraConfigLuaPre =
      # lua
      ''
        local slow_format_filetypes = {}

        vim.api.nvim_create_user_command("FormatDisable", function(args)
           if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end, {
          desc = "Disable autoformat-on-save",
          bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end, {
          desc = "Re-enable autoformat-on-save",
        })
        vim.api.nvim_create_user_command("FormatToggle", function(args)
          if args.bang then
            -- Toggle formatting for current buffer
            vim.b.disable_autoformat = not vim.b.disable_autoformat
          else
            -- Toggle formatting globally
            vim.g.disable_autoformat = not vim.g.disable_autoformat
          end
        end, {
          desc = "Toggle autoformat-on-save",
          bang = true,
        })
      '';
    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        formatters_by_ft = {
          html = [
            [
              "prettierd"
            ]
          ];
          css = [
            [
              "prettierd"
            ]
          ];
          javascript = [
            [
              "prettierd"
              "eslint_d"
            ]
          ];
          javascriptreact = [
            [
              "prettierd"
              "eslint_d"
            ]
          ];
          typescript = [
            [
              "prettierd"
              "eslint_d"
            ]
          ];
          typescriptreact = [
            [
              "prettierd"
              "eslint_d"
            ]
          ];
          python = [
            "black"
            "isort"
          ];
          lua = [ "stylua" ];
          nix = [ "alejandra" ];
          markdown = [
            [
              "prettierd"
            ]
          ];
          yaml = [
            [
              "prettierd"
            ]
          ];
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          json = [ "prettierd" ];
          "_" = [ "trim_whitespace" ];
          "*" = [ "codespell" ];
        };

        formatters = {
          black = {
            command = "${lib.getExe pkgs.black}";
          };
          isort = {
            command = "${lib.getExe pkgs.isort}";
          };
          alejandra = {
            command = "${lib.getExe pkgs.alejandra}";
          };
          jq = {
            command = "${lib.getExe pkgs.jq}";
          };
          prettierd = {
            command = "${lib.getExe pkgs.prettierd}";
            args = ["--stdin-filepath" "$FILENAME" "--single-attribute-per-line"];
          };
          stylua = {
            command = "${lib.getExe pkgs.stylua}";
          };
          shellcheck = {
            command = "${lib.getExe pkgs.shellcheck}";
          };
          shfmt = {
            command = "${lib.getExe pkgs.shfmt}";
          };
          shellharden = {
            command = "${lib.getExe pkgs.shellharden}";
          };
          eslint_d = {
            command = "${lib.getExe pkgs.eslint_d}";
          };
          codespell = {
            command = "${lib.getExe pkgs.codespell}";
          };
        };
      };
    };
  };
}
