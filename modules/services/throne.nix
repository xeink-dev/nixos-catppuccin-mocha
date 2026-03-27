{ config, pkgs, ... }:

{
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;

  boot.kernelModules = [ "tun" ];
}
