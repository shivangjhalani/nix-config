{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          clangd.enable = true;
          gopls.enable = true;
          nixd.enable = true;
          eslint.enable = true;
          html.enable = true;
          cssls.enable = true;
          ts_ls.enable = true;
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
      };
    };

    extraConfigLua = ''
      -- Ensure Telescope is loaded
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- LSP Keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Use Telescope for LSP operations
          map('gd', function() builtin.lsp_definitions() end, '[G]oto [D]efinition')
          map('gr', function() builtin.lsp_references() end, '[G]oto [R]eferences')
          map('gI', function() builtin.lsp_implementations() end, '[G]oto [I]mplementation')
          map('<leader>D', function() builtin.lsp_type_definitions() end, 'Type [D]efinition')
          map('<leader>ds', function() builtin.lsp_document_symbols() end, '[D]ocument [S]ymbols')
          map('<leader>ws', function() builtin.lsp_dynamic_workspace_symbols() end, '[W]orkspace [S]ymbols')

          -- Other LSP mappings
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Highlight references
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method('textDocument/documentHighlight') then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    '';
  };
}
