{ ... }:

{
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.allowedTCPPorts = [ 22 ];
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
}
