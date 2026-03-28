{ c, lib, ... }:

{
  services.mako = lib.mkForce {
    enable = true;
    defaultTimeout = 5000;
    settings = {
      font = "JetBrainsMono Nerd Font 10";
      width = 300;
      height = 100;
      margin = "10";
      padding = "15";
      border-size = 2;
      border-radius = 8;

      background-color = "${c.base}";
      text-color = "${c.text}";
      border-color = "${c.mauve}";
      progress-color = "over ${c.surface0}";
    };

    extraConfig = ''
      [urgency=high]
      border-color=${c.red}
      default-timeout=0
    '';
  };
}
