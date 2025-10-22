{ pkgs, lib, lanzaboote, ... }:

{
  #imports = [ lanzaboote.nixModules.lanzaboote ];

  environment.systemPackages = [ pkgs.sbctl ];

  # at least for now, Lanzaboote needs to replace the systemd-boot module
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
