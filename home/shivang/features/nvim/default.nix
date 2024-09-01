{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    # Basic configuration
    viAlias = true;
    vimAlias = true;

    # You can add your NixVim configuration here
    # For example:
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };
}
