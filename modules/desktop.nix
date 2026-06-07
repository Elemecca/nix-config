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
    podman-compose
    system-config-printer
  ];

  virtualisation.libvirtd.enable = true;

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  nix.settings = {
    substituters = [
      "https://fossar.cachix.org"
    ];
    trusted-public-keys = [
      "fossar.cachix.org-1:Zv6FuqIboeHPWQS7ysLCJ7UT7xExb4OE8c4LyGb5AsE="
    ];
  };

  # make /etc/hosts a regular file, rather than a symlink to the Nix store
  # this allows temporary edits for local development work
  environment.etc.hosts.mode = "0644";
}
