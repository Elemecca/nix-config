{ config, lib, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.flatpak.enable = true;

  programs.firefox.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip  # HP laser printers
    ];
  };

  environment.systemPackages = with pkgs; [
    system-config-printer
  ];

  virtualisation.libvirtd.enable = true;
}
