{ pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  users.users.shivang.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    virt-viewer
    #virtio-win
    #win-spice
  ];
  programs.virt-manager.enable = true;

  # Make sure the default NAT network is always up
  systemd.services.libvirtd.wantedBy = [ "multi-user.target" ];

  # Allow traffic on the libvirt bridge
  networking.firewall.trustedInterfaces = [ "virbr0" ];

  # If you use NetworkManager, make sure it ignores virbr0
  networking.networkmanager.unmanaged = [ "interface-name:virbr0" ];

  # Done in home/.../dconf.nix
  # home-manager.users.shivang = {
  #   dconf.settings = {
  #     "org/virt-manager/virt-manager/connections" = {
  #       autoconnect = [ "qemu:///system" ];
  #       uris = [ "qemu:///system" ];
  #     };
  #   };
  # };
}
