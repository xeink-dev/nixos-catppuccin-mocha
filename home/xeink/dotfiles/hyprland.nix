{ c, pkgs, lib, ... }:
let
  unhash = hex: builtins.substring 1 (builtins.stringLength hex) hex;
in
{
  wayland.windowManager.hyprland.enable = true;

  xdg.configFile."hypr/hyprland.conf".text = ''

      ################
      ### MONITORS ###
      ################

      monitor=,preferred,auto,auto

      ###################
      ### MY PROGRAMS ###
      ###################
      $terminal = kitty
      $explorer = nemo
      $browser = firefox
      $code = zeditor
      $vpn = Throne
      $messanger = AyuGram
      $monitoring = kitty btop
      $music = pear-desktop

      #################
      ### AUTOSTART ###
      #################

      exec-once = hyprpaper
      exec-once = waybar
      exec-once = mako
      exec-once = hypridle
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
      exec-once = $vpn

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      env = QT_QPA_PLATFORMTHEME,kvantum
      env = QT_STYLE_OVERRIDE,kvantum
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      env = QT_AUTO_SCREEN_SCALE_FACTOR="1"

      env = XDG_CURRENT_DESKTOP="Hyprland"
      env = XDG_SESSION_TYPE="wayland"
      env = XDG_SESSION_DESKTOP="Hyprland"

      env = GDK_BACKEND="wayland,x11,*"
      env = QT_QPA_PLATFORM="waylandxcb"

      env = NIXOS_OZONE_WL="1"
      env = ELECTRON_OZONE_PLATFORM_HINT,auto



      #####################
      ### LOOK AND FEEL ###
      #####################

      general {
        border_size = 1
        gaps_in = 5
        float_gaps = 20
        gaps_out = 5
        col.inactive_border = rgba(${unhash c.base}ff)
        col.active_border = rgba(${unhash c.mauve}ff) rgba(${unhash c.rosewater}ff) 90deg
        layout = dwindle
        no_focus_fallback = false
        resize_on_border = false
        allow_tearing = false

        snap {
          enabled = true
          window_gap = 10
          monitor_gap = 10
          border_overlap = false
          respect_gaps = true
        }
      }

      decoration {
        rounding = 10
        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
        dim_modal = false
        dim_inactive = false
        dim_strength = 0.5
        dim_special = 0.5
        dim_around = 0.5
        border_part_of_window = true

        shadow {
          enabled = false
          range = 4
          render_power = 3
          # color = rgba(1a1a1aee)
        }
        blur {
          enabled = true
          size = 3
          passes = 1
          ignore_opacity = true
          new_optimizations = true
          xray = false
          noise = 0.0117
          contrast = 0.8916
          brightness = 0.8172
          vibrancy = 0.1696
          vibrancy_darkness = 0.0
          special = true
          popups = false
          popups_ignorealpha = 0.2
          input_methods = false
          input_methods_ignorealpha = 0.2
          }
      }

      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      #############
      ### INPUT ###
      #############

      input {
        kb_layout = us,ru
        kb_options = caps:none

        repeat_rate = 40
        repeat_delay = 200
        follow_mouse = 1
        off_window_axis_events = 2

        touchpad {
          natural_scroll = true
          # disable_while_typing = true
          middle_button_emulation = true
        }
      }

      # gestures = 3, horizontal, workspace

      ###################
      ### KEYBINDINGS ###
      ###################

      $main = SUPER

      # Apps

      bind = $main, Return, exec, $terminal
      bind = $main, B, exec, $browser
      bind = $main ALT, B, exec, chromium
      bind = $main, C, exec, $code
      bind = $main, E, exec, $explorer
      bind = $main, A, exec, rofi -show drun
      bind = $main CTRL, L, exec, hyprlock
      bind = $main, M, exec, $messanger
      bind = $main, O, exec, obsidian
      bind = $main, N, exec, $monitoring
      bind = $main, V, exec, $vpn
      bind = $main, Y, exec, $music

      # System

      bind = $main, Print, exec, grim - | swappy -f -
      bind = , Print, exec, grim -g "$(slurp)" - | swappy -f -
      bind = $main SHIFT, Print, exec, hyprpicker -a

      bind = $main, I, exec, $terminal nmtui
      bind = $main, T, exec, $terminal bluetuith
      bind = $main, P, exec, $terminal pulsemixer

      bind = bind = $main ALT, R, exec, reboot
      bind = bind = $main ALT, P, exec, poweroff

      bind = $main, Q, killactive,
      bind = $main Alt, Q, exec, hyprctl clients -j | jq -r \".[] | select(.workspace.id == $(hyprctl activeworkspace -j | jq '.id')) | .address\" | xargs -I {} hyprctl dispatch closewindow address:{}
      bind = $main, Delete, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit

      bindl = , code:66, exec, hyprctl switchxkblayout current next
      bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

      bindel = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
      bindel = , XF86MonBrightnessDown, exec, brightnessctl set 5%-

      # Focus

      bind = $main, L, movefocus, l
      bind = $main, H, movefocus, r
      bind = $main, K, movefocus, u
      bind = $main, J, movefocus, d

      # Move window

      bind = $main ALT, H, movewindow, l
      bind = $main ALT, L, movewindow, r
      bind = $main ALT, K, movewindow, u
      bind = $main ALT, J, movewindow, d

      # Resize

      binde = $main SHIFT, L, resizeactive, 20 0
      binde = $main SHIFT, H, resizeactive, -20 0
      binde = $main SHIFT, K, resizeactive, 0 -20
      binde = $main SHIFT, J, resizeactive, 0 20

      # States

      bind = $main, F, fullscreen
      bind = $main, D, togglefloating,
      bind = $main, G, togglesplit

      # Workspaces

      bind = $main, 1, workspace, 1
      bind = $main, 2, workspace, 2
      bind = $main, 3, workspace, 3
      bind = $main, 4, workspace, 4
      bind = $main, 5, workspace, 5
      bind = $main, 6, workspace, 6
      bind = $main, 7, workspace, 7
      bind = $main, 8, workspace, 8
      bind = $main, 9, workspace, 9
      bind = $main, 0, workspace, 10

      # Move to workspace

      bind = $main ALT, 1, movetoworkspace, 1
      bind = $main ALT, 2, movetoworkspace, 2
      bind = $main ALT, 3, movetoworkspace, 3
      bind = $main ALT, 4, movetoworkspace, 4
      bind = $main ALT, 5, movetoworkspace, 5
      bind = $main ALT, 6, movetoworkspace, 6
      bind = $main ALT, 7, movetoworkspace, 7
      bind = $main ALT, 8, movetoworkspace, 8
      bind = $main ALT, 9, movetoworkspace, 9
      bind = $main ALT, 0, movetoworkspace, 10

      # Move to workspace silent

      bind = $main CTRL, 1, movetoworkspacesilent, 1
      bind = $main CTRL, 2, movetoworkspacesilent, 2
      bind = $main CTRL, 3, movetoworkspacesilent, 3
      bind = $main CTRL, 4, movetoworkspacesilent, 4
      bind = $main CTRL, 5, movetoworkspacesilent, 5
      bind = $main CTRL, 6, movetoworkspacesilent, 6
      bind = $main CTRL, 7, movetoworkspacesilent, 7
      bind = $main CTRL, 8, movetoworkspacesilent, 8
      bind = $main CTRL, 9, movetoworkspacesilent, 9
      bind = $main CTRL, 0, movetoworkspacesilent, 10

      # Special workspace

      bind = $main, S, togglespecialworkspace, magic
      bind = $main ALT, S, movetoworkspace, special:magic
      bind = $main CTRL, S, movetoworkspacesilent, special:magic

      # Scroll through workspaces

      bindm = $main, mouse:272, movewindow
      bindm = $main, mouse:273, resizewindow

      bind = $main, mouse_down, workspace, e+1
      bind = $main, mouse_up, workspace, e-1

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      windowrule {
          name = Throne
          match:class = ^($vpn)$
          float = true
          center = true
          size = (monitor_w*0.5) (monitor_h*0.75)
      }


      windowrule {
        name = $messanger
        match:class = ^(com.ayugram.desktop)$
        float = true
        center = true
        size = (monitor_w*0.9) (monitor_h*0.9)
      }

      windowrule {
          name = picture_in_picture
          match:title = ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$
          tag = +picture-in-picture
          float = true
          keep_aspect_ratio = true
          move = (monitor_w*0.74) (monitor_h*0.76)
          size = (monitor_w*0.25) (monitor_h*0.225)
          pin = true
      }

      windowrule {
          # Ignore maximize requests from all apps. You'll probably like this.
          name = suppress-maximize-events
          match:class = .*

          suppress_event = maximize
      }

      windowrule {
          # Fix some dragging issues with XWayland
          name = fix-xwayland-drags
          match:class = ^$
          match:title = ^$
          match:xwayland = true
          match:float = true
          match:fullscreen = false
          match:pin = false

          no_focus = true
      }
    '';
}
