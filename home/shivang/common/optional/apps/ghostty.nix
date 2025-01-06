{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = [
    inputs.ghostty.packages."${pkgs.system}".default
  ];

  home.file.".config/ghostty/config" = {
    source = ./ghostty/config;
    recursive = true;
  };
}
