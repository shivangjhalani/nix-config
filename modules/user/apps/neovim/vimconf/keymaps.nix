{ config, ... }:

{
  programs.nixvim = {
    keymaps = [
      {
	action = "<Nop>";
	key = "<Left>";
	options = { silent = true; };
      }
      {
	action = "<Nop>";
	key = "<Right>";
	options = { silent = true; };
      }
      {
	action = "<Nop>";
	key = "<Up>";
	options = { silent = true; };
      }
      {
	action = "<Nop>";
	key = "<Down>";
	options = { silent = true; };
      }
    ];
  };
}
