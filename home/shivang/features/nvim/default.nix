{
  inputs,
  pkgs,
  ...
}: {
  imports = [
  ];

  programs.neovim = {
    enable = true;
  };
}
