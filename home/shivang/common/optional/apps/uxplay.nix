{ pkgs, ... }:
{
  home.packages = with pkgs; [
    uxplay
    gst_all_1.gstreamer
  ];
}
