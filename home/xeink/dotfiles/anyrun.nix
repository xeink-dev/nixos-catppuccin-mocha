{ pkgs, c, ... }:

{
  programs.anyrun = {
    enable = true;
    config = {
      x.fraction = 0.5;
      y.fraction = 0.3;
      width.fraction = 0.3;
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = 10;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libsymbols.so"
        "${pkgs.anyrun}/lib/librcalc.so"
        "${pkgs.anyrun}/lib/libshell.so"
        "${pkgs.anyrun}/lib/libdictionary.so"
      ];
    };

    extraCss = ''
      window {
        background: transparent;
      }

      box#main {
        background: ${c.base};
        border: 2px solid ${c.blue};
        border-radius: 16px;
        padding: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      }

      entry#main {
        background: ${c.surface0};
        color: ${c.text};
        border-radius: 10px;
        padding: 8px 12px;
        margin-bottom: 8px;
        box-shadow: none;
        border: none;
      }

      list#main {
        background: transparent;
      }

      #match {
        padding: 8px;
        border-radius: 8px;
        margin: 2px 0;
      }

      #match.selected {
        background: ${c.blue};
        color: ${c.base};
      }

      #match.selected label#info,
      #match.selected label#title {
        color: ${c.base};
      }

      label#title {
        color: ${c.text};
        font-weight: bold;
      }

      label#info {
        color: ${c.overlay0};
        font-size: 0.8rem;
      }
    '';
  };
}
