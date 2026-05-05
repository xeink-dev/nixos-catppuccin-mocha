{ c, lib, ... }:

{
  programs.waybar = lib.mkForce {
    enable = true;
    settings = {
      mainBar = {
        height = 10;
        width = 1275;
        margin-top = 5;
        layer = "top";

        modules-left = [ "cpu" "memory" "idle_inhibitor" "clock" "mpris" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "custom/cmus" "pulseaudio" "backlight" "hyprland/language" "battery" ];

        "battery" = {
          states = { warning = 30; critical = 15; };
          format = "<span color='${c.mauve}'>{icon}</span> {capacity}%";
          format-charging = "<span color='${c.mauve}'></span> {capacity}% ";
          format-plugged = "<span color='${c.mauve}'></span> {capacity}% ";
          format-alt = "<span color='${c.mauve}'>{icon}</span> {time}";
          format-icons = [ "" "" "" "" "" ];
          interval = 60;
        };

        "cpu" = {
          format = "<span color='${c.red}'></span> {usage}%";
          tooltip = false;
          interval = 5;
          states = { warning = 50; critical = 90; };
        };

        "memory" = {
          format = "<span color='${c.peach}'></span> {used} GiB";
          tooltip = true;
          tooltip-format = "{used} GiB / {total} GiB ({percentage}%)";
          interval = 5;
          states = { warning = 50; critical = 90; };
        };

        "backlight" = {
          format = "<span color='${c.blue}'>{icon}</span> {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          on-scroll-up = "brightnessctl set 5%+";
          on-scroll-down = "brightnessctl set 5%-";
          smooth-scrolling-threshold = 1;
        };

        "idle_inhibitor" = {
          "format" = "<span color='${c.yellow}'>{icon}</span>";
          "format-icons" = {
          "activated" = "";
          "deactivated" = "";
          };
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = "<span color='${c.text}'></span>";
            active = "<span color='${c.text}'></span>";
            default = "<span color='${c.text}'></span>";
          };
          tooltip = false;
        };

        "hyprland/language" = {
          format = "<span color='${c.lavender}'>󰌏</span> {}";
          format-en = "EN";
          format-ru = "RU";
        };


        "pulseaudio" = {
          scroll-step = 5;
          reverse-scrolling = true;
          format = "<span color='${c.sky}'>{icon}</span> {volume}%";
          format-muted = "<span color='${c.red}'></span> {volume}%";
          format-icons = {
            headphone = "";
            default = [ "" "" ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-middle = "kitty pulsemixer";
          on-click-right = "kitty bluetuith";
          tooltip = false;
        };

        "clock" = {
          format = "<span color='${c.green}'></span> {:%H:%M}";
          tooltip-format = "<big><span color='${c.text}'>{:%Y %B}</span></big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "<span color='${c.maroon}'></span> <span color='${c.text}'>{:%d-%m-%Y}</span>";
          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            format = {
              months = "<span color='${c.text}'><b>{}</b></span>";
              days = "<span color='${c.text}'><b>{}</b></span>";
              weeks = "<span color='${c.pink}'><b>W{}</b></span>";
              weekdays = "<span color='${c.pink}'><b>{}</b></span>";
              today = "<span color='${c.maroon}'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        "mpris" = {
          format = "{player_icon} {title} - {artist}";
          "format-paused" = "{status_icon} <i>{title} - {artist}</i>";
          "player-icons" = {
            default = "<span color='${c.teal}'>▶</span>";
            spotify = "<span color='${c.teal}'></span>";
            firefox = "<span color='${c.teal}'></span>";
            vlc = "<span color='${c.teal}'>󰕼</span>";
          };

          "status-icons" = {
            paused = "<span color='${c.teal}'>⏸</span>";
          };

          "max-length" = 20;
          interval = 1;
        };

        "tray" = { icon-size = 18; spacing = 10; };
      };
    };

    style = ''
      * {
        font-family: "JetBrains Mono", "Symbols Nerd Font";
        font-weight: bold;
        font-size: 16px;
        min-height: 0;
      }

      window#waybar {
          border-radius: 20px;
          background-color: ${c.base};
      }

      #mpris {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #battery {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #battery.charging {
        color: ${c.green};
      }

      #battery.warning:not(.charging) {
        color: ${c.yellow};
      }

      #battery.critical:not(.charging) {
        color: ${c.red};
      }

      #battery:hover {
        color: ${c.yellow};
      }

      #cpu {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #cpu.warning {
        color: ${c.yellow};
      }

      #cpu.critical {
        color: ${c.red};
      }

      #memory {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #memory.warning {
        color: ${c.yellow};
      }

      #memory.critical {
        color: ${c.red};
      }

      #backlight {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #idle_inhibitor {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #workspaces {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;

      }

      #tray {
        padding: 2px 15px;
        margin: 5px;
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

     #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: ${c.red};
      }

      #language {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #language {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #pulseaudio {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #pulseaudio:hover {
        color: ${c.yellow};
      }

      #clock {
        padding: 2px 15px;
        margin: 5px;
        color: ${c.text};
        background-color: ${c.mantle};
        border: none;
        border-radius: 20px;
      }

      #clock:hover {
        color: ${c.yellow};
      }

      tooltip {
        background: ${c.base};
        border-radius: 10px;
        border: 2px solid ${c.surface0};
      }

      tooltip label {
        color: ${c.text};
        padding: 8px;
      }

    '';
  };
}
