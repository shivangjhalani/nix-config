{ pkgs, ... }:


{
  virtualisation.libvirtd = {
    enable = true;
    onShutdown = "suspend";
    qemu.package = pkgs.qemu_kvm;
    #spiceUSBRedirection.enable = true; #IDK WHAT THIS IS
  };

  users.users.shivang = {
    extraGroups = [ "networkmanager" "wheel" "libvirtd" 
      # "adbusers" #I think this is for the spiceUSBRedirection option above
    ];
  };
  # Added virt-manager in home.nix
  programs.virt-manager.enable = true;
}
