{ options, pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries =
      options.programs.nix-ld.libraries.default
      ++ (with pkgs; [
        # --- Core GUI & Windowing ---
        gtk3
        gdk-pixbuf
        pango
        cairo

        # --- Graphics & Hardware Acceleration ---
        mesa.drivers # Provides libgbm and hardware drivers
        mesa
        libgbm
        libglvnd # OpenGL vendor-neutral dispatch
        libdrm # Direct Rendering Manager
        libva # Video Acceleration API

        # --- X11 Libraries ---
        xorg.libX11
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxkbfile
        xorg.libxshmfence
        xorg.libxcb

        # --- Audio ---
        alsa-lib
        pipewire

        # --- System Integration & Services ---
        dbus
        libsecret # For password/token storage
        libnotify # For desktop notifications
        cups # For printing
        udev # Provides libudev

        # --- Core Dependencies & Parsers ---
        glib
        nss # Network Security Services
        nspr # Netscape Portable Runtime
        at-spi2-atk
        at-spi2-core
        expat # XML Parser
        freetype
        fontconfig
        libxkbcommon
      ]);
  };
}
