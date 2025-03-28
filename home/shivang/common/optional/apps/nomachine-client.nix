{pkgs, ...}: {
  home.packages = with pkgs; [
    nomachine-client
  ];
}

