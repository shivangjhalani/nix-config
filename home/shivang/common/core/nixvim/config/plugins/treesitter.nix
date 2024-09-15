{ pkgs, ... }:
{
	programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        go
        html css javascript
        markdown
        nix

        #bash
        #json
        #lua
        #make
        #regex
        #toml
        #vim
        #vimdoc
        #xml
        #yaml
      ];
      settings = {
        auto_install = true;
        # Highlight currently set to false, see if smth else also highlights, if no then enable this
        highlight = {
          enable = false;
          #disable = ''
          #  function(lang, buf)
          #      local max_filesize = 100 * 1024 -- 100 KB
          #      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          #      if ok and stats and stats.size > max_filesize then
          #          return true
          #      end
          #  end
          #  additional_vim_regex_highlighting = false
          #'';
        };
      };
    };
	};
}

