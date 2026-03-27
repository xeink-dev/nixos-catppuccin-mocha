{ pkgs, lib, ... }:

{
  boot.loader = lib.mkForce {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 10;

      theme = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "grub";
        rev = "88f6124";
        hash = "sha256-e8XFWebd/GyX44WQI06Cx6sOduCZc5z7/YhweVQGMGY=";
      } + "/src/catppuccin-mocha-grub-theme";
    };
  };
}
