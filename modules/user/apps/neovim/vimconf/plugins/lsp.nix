{
  programs.nixvim = {
    plugins = {
      lsp = {
	enable = true;
	servers = {
	
	# lua
	#lus-ls.enable = true;

	# c
	clangd.enable = true;

	# js
	tsserver.enable = true;

	};
      };
      nvim-cmp = {
	enable = true;
	autoEnableSources = true;
	sources = [
	  {name = "nvim_lsp";}
	  {name = "path";}
	  {name = "buffer";}
	];
	mapping = {
	  "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<Tab>" = {
	    action = ''
	      function(fallback)
		if cmp.visible() then
		  cmp.select_next_item()
		elseif luasnip.expandable() then
		  luasnip.expand()
		elseif luasnip.expand_or_jumpable() then
		  luasnip.expand_or_jump()
		elseif check_backspace() then
		  fallback()
		else
		  fallback()
		end
	      end
	    '';
	    modes = [ "i" "s" ];
	  };
	};
      }; 
    };
  };
}
