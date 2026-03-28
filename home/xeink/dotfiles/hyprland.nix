{ c, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      ################
      ### MONITORS ###
      ################

      "monitor" = ",preferred,auto,auto";

      ###################
      ### MY PROGRAMS ###
      ###################
      "$terminal" = "kitty";
      "$explorer" = "nemo";
      "$browser" = "firefox";
      "$code" = "zeditor";
      "$vpn" = "Throne";
      "$messanger" = "AyuGram";
      "$monitoring" = "kitty btop";

      #################
      ### AUTOSTART ###
      #################
      "exec-once" = [
        "swaybg -m fill -i ~/nixos/home/xeink/dotfiles/SPACE/wall.png"
        "mako"
        "hypridle"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "$vpn"
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      env = [
              "QT_QPA_PLATFORMTHEME,kvantum"
              "QT_STYLE_OVERRIDE,kvantum"
              "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
              "QT_AUTO_SCREEN_SCALE_FACTOR,1"

              "XDG_CURRENT_DESKTOP,Hyprland"
              "XDG_SESSION_TYPE,wayland"
              "XDG_SESSION_DESKTOP,Hyprland"

              "GDK_BACKEND,wayland,x11,*"
              "QT_QPA_PLATFORM,wayland;xcb"

              "NIXOS_OZONE_WL,1"
              "ELECTRON_OZONE_PLATFORM_HINT,auto"
            ];


      #####################
      ### LOOK AND FEEL ###
      #####################

      general = {
        border_size = 1;
        gaps_in = 5;
        float_gaps = 20;
        gaps_out = 5;
        "col.inactive_border" = lib.mkForce "rgba(${lib.removePrefix "#" c.base}ff)";
        "col.active_border" = lib.mkForce "rgba(${lib.removePrefix "#" c.mauve}ff) rgba(${lib.removePrefix "#" c.rosewater}ff) 90deg";
        layout = "dwindle";
        no_focus_fallback = false;
        resize_on_border = false;
        allow_tearing = false;

        snap = {
          enabled = true;
                  window_gap = 10;
                  monitor_gap = 10;
          border_overlap = false;
          respect_gaps = true;
          };
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        dim_modal = false;
        dim_inactive = false;
        dim_strength = 0.5;
        dim_special = 0.5;
        dim_around = 0.5;
        border_part_of_window = true;

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          # color = rgba(1a1a1aee);
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          ignore_opacity = true;
          new_optimizations = true;
          xray = false;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
          special = true;
          popups = false;
          popups_ignorealpha = 0.2;
          input_methods = false;
          input_methods_ignorealpha = 0.2;
          };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      #############
      ### INPUT ###
      #############

      input = {
        kb_layout = "us,ru";
        kb_options = "caps:none";

        repeat_rate = 40;
        repeat_delay = 200;
        follow_mouse = 1;
        off_window_axis_events = 2;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          middle_button_emulation = true;
        };
      };

      # gestures = [ "3, horizontal, workspace" ];

      gestures = {
        workspace_swipe_distance = 300;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_forever = true;
      };

      ###################
      ### KEYBINDINGS ###
      ###################

      "$main" = "SUPER";

      bind = [
        "$main, Return, exec, $terminal"
        "$main, B, exec, $browser"
        "$main, Z, exec, $code"
        "$main, E, exec, $explorer"
        "$main, A, exec, rofi -show drun"
        "$main, L, exec, hyprlock"
        "$main, M, exec, $messanger"
        "$main, O, exec, obsidian"
        "$main, N, exec, $monitoring"
        "$main, V, exec, $vpn"
        "$main, C, exec, qalculate-gtk"

        "$main, Print, exec, grim - | swappy -f -"
        ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
        "$main SHIFT, Print, exec, hyprpicker -a"

        "$main, I, exec, $terminal nmtui"
        "$main, T, exec, $terminal bluetuith"
        "$main, P, exec, $terminal pulsemixer"

        "bind = $main CTRL, R, exec, reboot"
        "bind = $main CTRL, P, exec, poweroff"

        "$main, Q, killactive,"
        "$main SHIFT, Q, exec, hyprctl clients -j | jq -r \".[] | select(.workspace.id == $(hyprctl activeworkspace -j | jq '.id')) | .address\" | xargs -I {} hyprctl dispatch closewindow address:{}"
        "$main, Delete, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "$main, F, fullscreen"
        "$main, W, togglefloating,"
        "$main, J, togglesplit"

        # Workspaces
        "$main, 1, workspace, 1"
        "$main, 2, workspace, 2"
        "$main, 3, workspace, 3"
        "$main, 4, workspace, 4"
        "$main, 5, workspace, 5"
        "$main, 6, workspace, 6"
        "$main, 7, workspace, 7"
        "$main, 8, workspace, 8"
        "$main, 9, workspace, 9"
        "$main, 0, workspace, 10"

        # Move window
        "$main CTRL, left,  movewindow, l"
        "$main CTRL, right, movewindow, r"
        "$main CTRL, up,    movewindow, u"
        "$main CTRL, down,  movewindow, d"

        # Focus
        "$main, left,  movefocus, l"
        "$main, right, movefocus, r"
        "$main, up,    movefocus, u"
        "$main, down,  movefocus, d"

        # Move to workspace
        "$main SHIFT, 1, movetoworkspace, 1"
        "$main SHIFT, 2, movetoworkspace, 2"
        "$main SHIFT, 3, movetoworkspace, 3"
        "$main SHIFT, 4, movetoworkspace, 4"
        "$main SHIFT, 5, movetoworkspace, 5"
        "$main SHIFT, 6, movetoworkspace, 6"
        "$main SHIFT, 7, movetoworkspace, 7"
        "$main SHIFT, 8, movetoworkspace, 8"
        "$main SHIFT, 9, movetoworkspace, 9"
        "$main SHIFT, 0, movetoworkspace, 10"

        # Move to workspace silent
        "$main ALT, 1, movetoworkspacesilent, 1"
        "$main ALT, 2, movetoworkspacesilent, 2"
        "$main ALT, 3, movetoworkspacesilent, 3"
        "$main ALT, 4, movetoworkspacesilent, 4"
        "$main ALT, 5, movetoworkspacesilent, 5"
        "$main ALT, 6, movetoworkspacesilent, 6"
        "$main ALT, 7, movetoworkspacesilent, 7"
        "$main ALT, 8, movetoworkspacesilent, 8"
        "$main ALT, 9, movetoworkspacesilent, 9"
        "$main ALT, 0, movetoworkspacesilent, 10"

        # Special workspace
        "$main, S, togglespecialworkspace, magic"
        "$main SHIFT, S, movetoworkspace, special:magic"
        "$main ALT, S, movetoworkspacesilent, special:magic"

        # Scroll through workspaces
        "$main, mouse_down, workspace, e+1"
        "$main, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$main, mouse:272, movewindow"
        "$main, mouse:273, resizewindow"
      ];

      bindl = [
        ", code:66, exec, hyprctl switchxkblayout current next"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      binde = [
        "$main SHIFT, right, resizeactive, 20 0"
        "$main SHIFT, left,  resizeactive, -20 0"
        "$main SHIFT, up,    resizeactive, 0 -20"
        "$main SHIFT, down,  resizeactive, 0 20"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];


      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      windowrulev2 = [
        #"float, class:^($vpn)$"
        #"center, class:^($vpn)$"

       #"float,class:^(nm-connection-editor)$"
       #"center,class:^(nm-connection-editor)$"
       #"size 600 500,class:^(nm-connection-editor)$"

       #"float,class:^(blueman-manager)$"
       #"center,class:^(blueman-manager)$"

       #"float,class:^(org.pulseaudio.pavucontrol)$"
       #"center,class:^(org.pulseaudio.pavucontrol)$"
        #"size 700 450,class:^(org.pulseaudio.pavucontrol)$"

        #"float,title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        #"pin,title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        #"keepaspectratio,title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        #"size 25% 22.5%,title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        #"move 74% 76%,title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"

        # "float,class:^(otter-launcher)$"
        # "center,class:^(otter-launcher)$"
        # "float,class:^(com.network.manager)$"
        # "float,class:^(org.pulseaudio.pavucontrol)$"
        # "float,class:^(koala-clash)$"
        # "suppress_event maximize,class:.*"

        # "suppressmaximize,class:.*"
        # "noanim,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        # "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
