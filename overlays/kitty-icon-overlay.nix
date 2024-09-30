{pkgs}: final: prev: {
  kitty = prev.kitty.overrideAttrs (oldAttrs: {
    postInstall =
      (oldAttrs.postInstall or "")
      + ''
        # Remove all existing Kitty icons
        rm -f $out/share/icons/hicolor/*/apps/kitty.png
        rm -f $out/share/icons/hicolor/*/apps/kitty.svg
        rm -f $out/share/icons/hicolor/scalable/apps/kitty.svg

        # Copy PNG icon
        cp -f ${./kitty-icons/kitty.app.png} $out/share/icons/hicolor/256x256/apps/kitty.png
        cp -f ${./kitty-icons/kitty.app.png} $out/lib/kitty/logo/kitty.png

        # Update icon cache
        ${pkgs.gtk3.out}/bin/gtk-update-icon-cache -f -t $out/share/icons/hicolor
      '';
  });
}
