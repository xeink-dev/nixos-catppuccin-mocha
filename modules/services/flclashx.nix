{ pkgs, ... }:

let
  flclash-pkg = pkgs.appimageTools.wrapType2 {
    pname = "flclashx";
    version = "latest";

    src = ./FlClashX-linux-amd64.AppImage;

    extraPkgs = pkgs: with pkgs; [
      libepoxy
      libappindicator
      libsecret
      gtk3
      nss
      nspr
      atk
      at-spi2-atk
      dbus
      libdrm
      mesa
      alsa-lib
    ];
  };
in
{
  environment.systemPackages = [ flclash-pkg ];

}
