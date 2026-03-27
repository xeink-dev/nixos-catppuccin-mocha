{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/core
    ../../modules/desktop
    ../../modules/services
  ];

  users.users.xeink = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };

  networking.hostName = "nixos";

  system.stateVersion = "25.11";
}
