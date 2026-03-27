{ c, lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.95";
      window_padding_width = 10;

      foreground = "${c.text}";
      background = "${c.base}";
      selection_foreground = "${c.base}";
      selection_background = "${c.rosewater}";
      cursor = "${c.rosewater}";
      cursor_text_color = "${c.base}";

      color0 = "${c.surface1}"; # Black
      color8 = "${c.surface2}"; # Bright Black
      color1 = "${c.red}";      # Red
      color9 = "${c.red}";      # Bright Red
      color2 = "${c.green}";    # Green
      color10 = "${c.green}";   # Bright Green
      color3 = "${c.yellow}";   # Yellow
      color11 = "${c.yellow}";  # Bright Yellow
      color4 = "${c.blue}";     # Blue
      color12 = "${c.blue}";    # Bright Blue
      color5 = "${c.pink}";     # Magenta
      color13 = "${c.pink}";    # Bright Magenta
      color6 = "${c.teal}";     # Cyan
      color14 = "${c.teal}";    # Bright Cyan
      color7 = "${c.subtext1}"; # White
      color15 = "${c.subtext0}";# Bright White
    };
  };
}
