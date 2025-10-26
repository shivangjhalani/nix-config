{ config, lib, ... }:
let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in
{
  programs.nixvim = {
    plugins = {
      friendly-snippets = {
        enable = true;
      };
      luasnip.enable = true;
      copilot-lua = {
        enable = true;
        settings = {
          suggestion.enabled = false;
          panel.enabled = false;
          filetypes = {
            yaml = false;
            markdown = false;
            help = false;
            gleam = false; # Copilot doesn't really help when writing Gleam
            gitcommit = false;
            gitrebase = false;
            hgcommit = false;
            svn = false;
            cvs = false;
            "." = false;
          };
        };
      };

      cmp-buffer = {
        enable = true;
      };

      cmp-emoji = {
        enable = true;
      };

      cmp-nvim-lsp = {
        enable = true;
      };

      cmp-path = {
        enable = true;
      };

      cmp_luasnip = {
        enable = true;
      };

      cmp = {
        enable = true;

        settings = {
          experimental = {
            ghost_text = true;
          };
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            {
              name = "nvim_lsp";
              priority = 1000;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "nvim_lsp_signature_help";
              priority = 1000;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "gitlab";
              priority = 1000;
              option = {
                hosts = [ "https://gitlab.dnm.radiofrance.fr" ];
              };
            }
            {
              name = "nvim_lsp_document_symbol";
              priority = 1000;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "treesitter";
              priority = 850;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "luasnip";
              priority = 750;
            }
            {
              name = "buffer";
              priority = 500;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "copilot";
              priority = 400;
            }
            {
              name = "rg";
              priority = 300;
            }
            {
              name = "path";
              priority = 300;
            }
            {
              name = "cmdline";
              priority = 300;
            }
            {
              name = "spell";
              priority = 300;
            }
            {
              name = "git";
              priority = 250;
            }
            {
              name = "zsh";
              priority = 250;
            }
            {
              name = "calc";
              priority = 150;
            }
            {
              name = "emoji";
              priority = 100;
            }
          ];

          formatting = {
            fields = [
              "abbr"
              "kind"
              "menu"
            ];
            format =
              # lua
              ''
                function(_, item)
                  local icons = {
                    Namespace = "󰌗",
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰆧",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈚",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "󰊄",
                    Table = "",
                    Object = "󰅩",
                    Tag = "",
                    Array = "[]",
                    Boolean = "",
                    Number = "",
                    Null = "󰟢",
                    String = "󰉿",
                    Calendar = "",
                    Watch = "󰥔",
                    Package = "",
                    Copilot = "",
                    Codeium = "",
                    TabNine = "",
                  }

                  local icon = icons[item.kind] or ""
                  item.kind = string.format("%s %s", icon, item.kind or "")
                  return item
                end
              '';
          };

          window = {
            completion = {
              winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
              scrollbar = false;
              sidePadding = 0;
              border = [
                "╭"
                "─"
                "╮"
                "│"
                "╯"
                "─"
                "╰"
                "│"
              ];
            };

            settings.documentation = {
              border = [
                "╭"
                "─"
                "╮"
                "│"
                "╯"
                "─"
                "╰"
                "│"
              ];
              winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
            };
          };

          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<S-Tab>" = "cmp.mapping.close()";
            "<Tab>" =
              # lua
              ''
                function(fallback)
                  local line = vim.api.nvim_get_current_line()
                  if line:match("^%s*$") then
                    fallback()
                  elseif cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                  else
                    fallback()
                  end
                end
              '';
            "<Down>" =
              # lua
              ''
                function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                  else
                    fallback()
                  end
                end
              '';
            "<Up>" =
              # lua
              ''
                function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                  else
                    fallback()
                  end
                end
              '';
          };
        };
      };
    };
  };
}
