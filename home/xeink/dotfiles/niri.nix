{ c, lib, pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".text = ''

      //#############
      //### INPUT ###
      //#############

      input {
        keyboard {
          xkb {
            layout "us,ru"
            variant ""
            options "grp:caps_toggle,caps:none"
            model ""
          }
          repeat-delay 250
          repeat-rate 35
          track-layout "global"
          // numlock
        }
        touchpad {
          // off
          tap
          // dwt
          // dwtp
          drag true
          drag-lock
          natural-scroll
          accel-speed 0.2
          accel-profile "adaptive"
          scroll-factor 1.0
          // scroll-factor vertical=1.0 horizontal=-2.0
          scroll-method "two-finger"
          scroll-button 273
          scroll-button-lock
          tap-button-map "left-right-middle"
          click-method "clickfinger"
          // left-handed
          // disabled-on-external-mouse
          // middle-emulation
        }
        mouse {
          // off
          // natural-scroll
          accel-speed 0.2
          accel-profile "flat"
          scroll-factor 1.0
          // scroll-factor vertical=1.0 horizontal=-2.0
          // scroll-method "no-scroll"
          scroll-button 273
          scroll-button-lock
          // left-handed
          // middle-emulation
        }
        disable-power-key-handling
        warp-mouse-to-focus
        focus-follows-mouse max-scroll-amount="0%"
        workspace-auto-back-and-forth

        mod-key "Super"
        // mod-key-nested "Alt"
      }

      //###############
      //### OUTPUTS ###
      //###############

      output "eDP-1" {
        // off
        mode "2560x1600@60.0"
        scale 2.0
        transform "normal"
        position x=0 y=0
        variable-refresh-rate on-demand=true
        focus-at-startup
        background-color "${c.base}"
        //hot-corners {
          // off
        // top-left {
        //   spawn "niri" "msg" "action" "toggle-overview"
        // }
        // top-right {

        // }
        // bottom-left {
        //   spawn "rofi -show drun"
        // }
        // bottom-right {
        //   spawn "sh" "-c" "${pkgs.hyprlock}/bin/hyprlock & niri msg action power-off-monitors"
        // }
        //}
        layout {
          gaps 5
          center-focused-column "never"
          default-column-width { proportion 0.6; }
          struts {
            top 0
            bottom 0
            left 0
            right 0
          }
        }
      }

      //#############
      //### BINDS ###
      //#############

      binds {

        Mod+Shift+slash { show-hotkey-overlay; }

        // Apps
        Mod+Return { spawn "kitty"; }
        Mod+B { spawn "firefox"; }
        Mod+Alt+B { spawn "chromium"; }
        Mod+C { spawn "zeditor"; }
        Mod+E { spawn "nemo"; }
        Mod+A { spawn "rofi" "-show" "drun"; }
        Mod+Shift+L { spawn "hyprlock"; }
        Mod+Y { spawn "AyuGram"; }
        Mod+O { spawn "kitty btop"; }
        Mod+V { spawn "Throne"; }

        // System
        Mod+Q { close-window; }
        Mod+Alt+Q { quit; }

        Mod+I { spawn "kitty" "nmtui"; }
        Mod+T { spawn "kitty" "bluetuith"; }
        Mod+P { spawn "kitty" "pulsemixer"; }

        Mod+Alt+P allow-when-locked=true { spawn "poweroff"; }
        Mod+Alt+R allow-when-locked=true { spawn "reboot"; }

        XF86AudioMute allow-when-locked=true { spawn "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
        XF86AudioMicMute allow-when-locked=true { spawn "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" ;}

        Print { screenshot show-pointer=false; }
        Mod+Print { screenshot-screen write-to-disk=false show-pointer=false; }

        Mod+Escape { toggle-keyboard-shortcuts-inhibit; }

        // Print { spawn "sh" "-c" "grim -g \"$(slurp)\" - | swappy -f -"; }
        // Mod+Print { spawn "sh" "-c" "grim - | swappy -f -"; }
        Mod+Alt+Print { spawn "hyprpicker" "-a"; }

        // Focus
        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }

        // Move
        Mod+Alt+H { move-column-left; }
        Mod+Alt+J { move-window-down; }
        Mod+Alt+K { move-window-up; }
        Mod+Alt+L { move-column-right; }

        Mod+N { consume-window-into-column; }
        Mod+M { expel-window-from-column; }

        // Resize
        Mod+Ctrl+H { set-column-width "-5%"; }
        Mod+Ctrl+J { set-window-height "-5%"; }
        Mod+Ctrl+K { set-window-height "+5%"; }
        Mod+Ctrl+L { set-column-width "+5%"; }

        Mod+Alt+1 { set-column-width "25%"; }
        Mod+Alt+2 { set-column-width "50%"; }
        Mod+Alt+3 { set-column-width "75%"; }
        Mod+Alt+4 { set-column-width "100%"; }

        Mod+Ctrl+1 { set-window-height "25%"; }
        Mod+Ctrl+2 { set-window-height "50%"; }
        Mod+Ctrl+3 { set-window-height "75%"; }
        Mod+Ctrl+4 { set-window-height "100%"; }

        // States
        // Mod+ { maximize-column; }
        Mod+F { fullscreen-window; }
        Mod+D { toggle-window-floating; }
        Mod+S { center-column; }

        Mod+G { toggle-column-tabbed-display; }

        // Workspaces
        // Mod++J { focus-workspace-down; }
        // Mod++K { focus-worspace-up; }

        // Mod++J { move-column-to-workspace-down; }
        // Mod++K { move-column-to-worspace-up; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+0 { focus-workspace 0; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }
        Mod+Shift+0 { move-column-to-workspace 0; }

        // Gestures

        Mod+TouchpadScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+TouchpadScrollUp cooldown-ms=150 { focus-workspace-up; }
        Mod+TouchpadScrollRight { focus-column-right; }
        Mod+TouchpadScrollLeft { focus-column-left; }

      }

      //#####################
      //### SWITCH EVENTS ###
      //#####################

      switch-events {
        "lid-close" { spawn "hyprlock"; }
      }

      //##############
      //### LAYOUT ###
      //##############

      layout {
        gaps 5
        center-focused-column "never"
        always-center-single-column
        empty-workspace-above-first
        default-column-display "tabbed"
        background-color "${c.base}"

        preset-column-widths {
          proportion 0.25
          proportion 0.5
          proportion 0.75
          proportion 1.0
        }

        default-column-width { proportion 0.5; }

        preset-window-heights {
          proportion 0.25
          proportion 0.5
          proportion 0.75
          proportion 1.0
        }

        focus-ring {
          // off
          on
          width 1
          active-color "${c.mauve}"
          inactive-color "${c.base}"
          urgent-color "${c.rosewater}"
        }

        border {
          off
          // on
          width 1
          active-color "${c.mauve}"
          inactive-color "${c.base}"
          urgent-color "${c.rosewater}"
        }

        shadow {
          // off
          on
          softness 30
          spread 1
          offset x=0 y=5

          draw-behind-window true
          color "${c.crust}"
          inactive-color "${c.crust}"

        }

        tab-indicator {
          // off
          on
          hide-when-single-tab
          place-within-column
          position "top"
          width 1
          length total-proportion=1.0
          gap 5
          gaps-between-tabs 5
          corner-radius 10
          active-color "${c.mauve}"
          inactive-color "${c.base}"
          urgent-color "${c.rosewater}"
        }

        insert-hint {
          // off
          on
          color "${c.base}"
        }

        struts {
          left 0
          right 0
          top 0
          bottom 0
        }
      }

      //########################
      //### NAMED WORKSPACES ###
      //########################



      //#####################
      //### MISCELLANEOUS ###
      //#####################

      // spawn-at-startup "waybar"
      spawn-at-startup "swaybg -m fill -i ~/nixos/home/xeink/dotfiles/SPACE/wall.png"
      spawn-at-startup "mako"
      spawn-at-startup "hypridle"
      spawn-at-startup "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"

      prefer-no-csd

      screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"


      environment {
        XDG_CURRENT_DESKTOP "niri"
        XDG_SESSION_DESKTOP "niri"
        XDG_SESSION_TYPE "wayland"

        GDK_BACKEND "wayland,x11,*"
        QT_QPA_PLATFORM "wayland;xcb"

        NIXOS_OZONE_WL "1"
        ELECTRON_OZONE_PLATFORM_HINT "auto"

        QT_QPA_PLATFORMTHEME "kvantum"
        QT_STYLE_OVERRIDE "kvantum"

        QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
        QT_AUTO_SCREEN_SCALE_FACTOR "1"
      }

      cursor {
        // hide-when-typing true
        // hide-after-inactive-ms 1000
      }

      overview {
        zoom 0.5
        backdrop-color "${c.base}"

          workspace-shadow {
              // off
              softness 40
              spread 10
              offset x=0 y=10
              color "${c.crust}"
          }
      }

      xwayland-satellite {
        // off
        path "xwayland-satellite"
      }

      clipboard {
        disable-primary
      }

      hotkey-overlay {
        skip-at-startup
        hide-not-bound
      }

      config-notification {
        // disable-failed true
      }

      // blur {
      //   // off
      //   passes 3
      //   offset 3.0
      //   noise 0.02
      //   saturation 1.5
      // }

      //####################
      //### WINDOW RULES ###
      //####################

      window-rule {
          match app-id="Throne"
          open-floating true
      }

      window-rule {
          match app-id="bluetuith"
          open-floating true
      }

      window-rule {
          match app-id="pulsemixer"
          open-floating true
      }

      window-rule {
          match app-id="nmtui"
          open-floating true
      }

      window-rule {
          match app-id="^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
          open-floating true
      }

      //###################
      //### LAYER RULES ###
      //###################

      layer-rule {
        match namespace="waybar"
        match namespace="rofi"
        shadow {
          on
          // off
          softness 40
          spread 5
          offset x=0 y=5
          draw-behind-window true
          color "${c.crust}"
          inactive-color "${c.base}"
        }

        geometry-corner-radius 12
        place-within-backdrop true
        // baba-is-float true

        // background-effect {
        //   xray true
        //   blur true
        //   noise 0.05
        //   saturation 3.0
        // }

      // popups {
      //   opacity 0.5
      //   geometry-corner-radius 6

      //   background-effect {
      //     xray true
      //     blur true
      //     noise 0.05
      //     saturation 3
      //   }
      //  }
      }

      //##################
      //### ANIMATIONS ###
      //##################

      animations {
        // off

        // slowdown 3.0

        workspace-switch {
          spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
        }

        window-open {
          duration-ms 150
          curve "ease-out-expo"
        }

        window-close {
          duration-ms 150
          curve "ease-out-quad"
        }

        horizontal-view-movement {
          spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }

        window-movement {
          spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }

        window-resize {
          spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }

        config-notification-open-close {
          spring damping-ratio=0.6 stiffness=1000 epsilon=0.001
        }

        exit-confirmation-open-close {
          spring damping-ratio=0.6 stiffness=500 epsilon=0.01
        }

        screenshot-ui-open {
          duration-ms 200
          curve "ease-out-quad"
        }

        overview-open-close {
          spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }

        recent-windows-close {
          spring damping-ratio=1.0 stiffness=800 epsilon=0.001
        }
      }

      //################
      //### GESTURES ###
      //################

      gestures {
        dnd-edge-view-scroll {
          trigger-width 30
          delay-ms 100
          max-speed 1500
        }

        dnd-edge-workspace-switch {
          trigger-height 50
          delay-ms 100
          max-speed 1500
        }

        // hot-corners {
        //   // off
        //   top-left
        //   top-right
        //   bottom-left
        //   bottom-right
        // }
      }

      //######################
      //### RECENT WINDOWS ###
      //######################

      recent-windows {
        // off
        debounce-ms 750

        open-delay-ms 150

        highlight {
          active-color "${c.mauve}"
          urgent-color "${c.rosewater}"
          padding 30
          corner-radius 0
        }

        previews {
          max-height 480
          max-scale 0.5
        }

        binds {
          Alt+Tab         { next-window; }
          Alt+Shift+Tab   { previous-window; }
          Alt+grave       { next-window     filter="app-id"; }
          Alt+Shift+grave { previous-window filter="app-id"; }

          Mod+Tab         { next-window; }
          Mod+Shift+Tab   { previous-window; }
          Mod+grave       { next-window     filter="app-id"; }
          Mod+Shift+grave { previous-window filter="app-id"; }
        }
      }

      //#####################
      //### DEBUG OPTIONS ###
      //#####################

      //debug {
      //    preview-render "screencast"
      //    // preview-render "screen-capture"
      //    enable-overlay-planes
      //    disable-cursor-plane
      //    disable-direct-scanout
      //    restrict-primary-scanout-to-matching-format
      //    force-disable-connectors-on-resume
      //    render-drm-device "/dev/dri/renderD129"
      //    ignore-drm-device "/dev/dri/renderD128"
      //    ignore-drm-device "/dev/dri/renderD130"
      //    force-pipewire-invalid-modifier
      //    dbus-interfaces-in-non-session-instances
      //    wait-for-frame-completion-before-queueing
      //    emulate-zero-presentation-time
      //    disable-resize-throttling
      //    disable-transactions
      //    keep-laptop-panel-on-when-lid-is-closed
      //    disable-monitor-names
      //    strict-new-window-focus-policy
      //    honor-xdg-activation-with-invalid-serial
      //    skip-cursor-only-updates-during-vrr
      //    deactivate-unfocused-windows
      //}
      //
      //binds {
      //    Mod+Shift+Ctrl+T { toggle-debug-tint; }
      //    Mod+Shift+Ctrl+O { debug-toggle-opaque-regions; }
      //    Mod+Shift+Ctrl+D { debug-toggle-damage; }
      //}

      //###############
      //### INCLUDE ###
      //###############



    '';
}
