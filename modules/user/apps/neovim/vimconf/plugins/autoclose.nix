{
  programs.nixvim = {
    plugins = {
      autoclose = {
	enable = true;
	# Keys are aready set by default, put here no use...
	keys = {
	  "(" = { escape = false; close = true; pair = "()"; };
	  "[" = { escape = false; close = true; pair = "[]"; };
	  "{" = { escape = false; close = true; pair = "{}"; };
	  
	  #"<" = { escape = false; close = true; pair = "<>"; };
	};
      };  
    };
  };
}
