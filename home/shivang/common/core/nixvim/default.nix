{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # IMPORTANT
    inputs.nixvim.homeManagerModules.nixvim

    ./config
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true; # install man pages for nixvim options
  };

  # TO ENABLE CLIPBOARD SUPPORT
  home.packages = [
    pkgs.wl-clipboard
  ];
}
