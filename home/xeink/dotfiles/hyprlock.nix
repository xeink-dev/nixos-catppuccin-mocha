{ config, lib, pkgs, ... }:

let
  c = import ../mocha.nix;
in
{
  programs.hyprlock = lib.mkForce {
    enable = true;
    settings = {
      # GENERAL
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };

      # BACKGROUND
      background = [{
        monitor = "";
        path = "~/nixos/home/xeink/dotfiles/SPACE/lock.png";
        blur_size = 4;
        blur_passes = 0;
        contrast = 1;
        brightness = 0.8;
        vibrancy = 0.2;
        vibrancy_darkness = 0;
      }];

      # INPUT FIELD
      "input-field" = [{
        #monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        outer_color = "${c.base}";
        inner_color = "${c.text}";
        font_color = "${c.base}";
        fade_on_empty = false;
        rounding = -1;
        check_color = "${c.text}";
        placeholder_text = "Input Password...";
        hide_input = false;
        position = "0, -350";
        halign = "center";
        valign = "center";
      }];

      # LABELS (Date, Time, User, etc.)
      label = [
        # DAY (Anurati)
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A" | sed 's/./& /g' | tr '[:lower:]' '[:upper:]')"'';
          color = "${c.text}";
          font_size = 110;
          font_family = "Anurati";
          position = "0, 450";
          halign = "center";
          valign = "center";
        }
        # DATE
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%B %d")"'';
          color = "${c.text}";
          font_size = 35;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        # TIME
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M %p")"'';
          color = "${c.text}";
          font_size = 95;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # User Tag
        {
          monitor = "";
          text = "❄️ $USER";
          color = "${c.text}";
          font_size = 20;
          font_family = "Inter Display Medium";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
        # Layout
        {
          monitor = "";
          text = "$LAYOUT";
          color = "${c.text}";
          font_size = 20;
          font_family = "JetBrainsMono Nerd Font";
          position = "1%, 1%";
          halign = "left";
          valign = "bottom";
        }
      ];

      # IMAGES
      image = [
        # Profile Picture
        {
          monitor = "";
          path = "~/.config/hypr/9400_5_2_01.jpg";
          size = 200;
          border_size = 2;
          border_color = "${c.text}";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
        # Hypr Logo
        {
          monitor = "";
          path = "/home/justin/Pictures/profile_pictures/hypr.png";
          size = 75;
          border_size = 2;
          border_color = "${c.text}";
          position = "-50, 50";
          halign = "right";
          valign = "bottom";
        }
      ];
    };
  };
}
