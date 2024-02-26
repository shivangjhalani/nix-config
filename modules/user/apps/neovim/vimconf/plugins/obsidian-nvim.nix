{ pkgs, ... }:

{
  home.packages = [
    pkgs.wl-clipboard
  ];
  programs.nixvim = {
    plugins = {
      obsidian = {
	enable = true;
	workspaces = [
	  { name = "ConqTheWrld"; path = "/home/sjay/sjay/obsidian/Notes/ConqTheWrld/"; }
	  { name = "MindMasturbation"; path = "/home/sjay/sjay/obsidian/Notes/MindMasturbation/"; }
	];
      };
    };
  };
}
