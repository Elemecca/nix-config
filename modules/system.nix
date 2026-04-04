{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = true;
  networking.nftables.enable = true;
  networking.firewall.allowedUDPPorts = [ 5353 ];

  services.resolved.enable = true;
#  services.resolved = {
#    enable = true;
#    settings = {
#      DNS = [
#        "1.1.1.1#one.one.one.one"
#        "1.0.0.1#one.one.one.one"
#        "2606:4700:4700::1111#one.one.one.one"
#        "2606:4700:4700::1001#one.one.one.one"
#      ];
#      Domains = [ "~." ];
#      DNSOverTLS = "true";
#
#      LLMNR = "resolve";
#      MulticastDNS = "resolve";
#    };
#  };

  environment.systemPackages = with pkgs; [
    file
    htop
    neovim
    tree
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.maia = {
    isNormalUser = true;
    description = "Maia";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
