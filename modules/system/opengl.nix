{pkgs, ...}: {
  # No need to enable opengl if you are enabling steam!!
  hardware.graphics = {
    enable = true;
    #driSupport = true; #This option no longer has any effect
    enable32Bit = true;
  };
}
