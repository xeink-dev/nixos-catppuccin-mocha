{ pkgs, c, config, lib, ... }:

{
  programs.rofi = lib.mkForce {
    enable = true;
    package = pkgs.rofi;

    font = "JetBrains Mono Nerd Font 10";

    extraConfig = {
      modi = "drun,run,filebrowser,window";
      show-icons = true;
      display-drun = "APPS";
      display-run = "RUN";
      display-filebrowser = "FILES";
      display-window = "WINDOW";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        back = mkLiteral "${c.base}";
        backalt = mkLiteral "${c.mantle}";
        foregr = mkLiteral "${c.text}";
        select = mkLiteral "${c.pink}";
        active = mkLiteral "${c.mauve}";
        urgent = mkLiteral "${c.red}";
        selected = mkLiteral "${c.flamingo}";
      };

      "window" = {
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "1000px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";

        enabled = true;
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "@back";
      };

      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "0px";
        orientation = mkLiteral "horizontal";
        children = map mkLiteral [ "imagebox" "listbox" ];
        background-color = mkLiteral "transparent";
      };

      "imagebox" = {
        padding = mkLiteral "20px";
        background-color = mkLiteral "transparent";
        background-image = mkLiteral "url(\"~/nixos/home/xeink/dotfiles/SPACE/rofiss.png\", height)";
        orientation = mkLiteral "vertical";
        children = map mkLiteral [ "inputbar" "dummy" "mode-switcher" ];
      };

      "listbox" = {
        spacing = mkLiteral "20px";
        padding = mkLiteral "20px";
        background-color = mkLiteral "transparent";
        children = map mkLiteral [ "message" "listview" ];
      };

      "dummy" = {
        background-color = mkLiteral "transparent";
      };

      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "10px";
        padding = mkLiteral "15px";
        border-radius = mkLiteral "10px";
        background-color = mkLiteral "@backalt";
        text-color = mkLiteral "@foregr";
        children = map mkLiteral [ "textbox-prompt-colon" "entry" ];
      };

      "textbox-prompt-colon" = {
        enabled = true;
        expand = false;
        str = "";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "entry" = {
        enabled = true;
        placeholder = mkLiteral "\"Search\"";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        placeholder-color = mkLiteral "inherit";
      };

      "mode-switcher" = {
        enabled = true;
        spacing = mkLiteral "20px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foregr";
      };

      "button" = {
        padding = mkLiteral "15px";
        border-radius = mkLiteral "10px";
        background-color = mkLiteral "@backalt";
        text-color = mkLiteral "inherit";
      };

      "button selected" = {
        background-color = mkLiteral "@select";
        text-color = mkLiteral "@back";
      };

      "listview" = {
        enabled = true;
        columns = mkLiteral "1";
        lines = mkLiteral "8";
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foregr";
        spacing = mkLiteral "10px";
      };


      "element" = {
        enabled = true;
        spacing = mkLiteral "15px";
        padding = mkLiteral "8px";
        border-radius = mkLiteral "10px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foregr";
      };

      "element normal.normal" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      "element normal.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foregr";
      };
      "element normal.active" = {
        background-color = mkLiteral "@active";
        text-color = mkLiteral "@foregr";
      };
      "element selected.normal" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@back";
      };
      "element selected.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foregr";
      };
      "element selected.active" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foregr";
      };
      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "32px";
        cursor = mkLiteral "inherit";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      "message" = {
        background-color = mkLiteral "transparent";
      };
      "textbox" = {
        padding = mkLiteral "15px";
        border-radius = mkLiteral "10px";
        background-color = mkLiteral "@backalt";
        text-color = mkLiteral "@foregr";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };
      "error-message" = {
        padding = mkLiteral "15px";
        border-radius = mkLiteral "20px";
        background-color = mkLiteral "@back";
        text-color = mkLiteral "@foregr";
      };
    };
  };
}
