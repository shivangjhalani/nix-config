{pkgs, ...}: {
  # No need to enable opengl if you are enabling steam!!
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
