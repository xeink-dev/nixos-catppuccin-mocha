{ pkgs, inputs, config, ... }:

{

  programs.librewolf = {
    enable = true;


    profiles.xeink = {
      isDefault = true;

      extensions = with inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        darkreader
        decentraleyes
        istilldontcareaboutcookies
        vimium

      ];

      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage" = "https://google.com";
        "browser.newtabpage.enabled" = false;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;

        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "datareporting.healthreport.uploadEnabled" = false;

        "services.sync.engine.prefs" = false;
        "services.sync.engine.addons" = false;
        "services.sync.engine.bookmarks" = false;
        "services.sync.engine.passwords" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layers.acceleration.force-enabled" = true;

        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;
      };

      userChrome = ''

      '';
    };
  };
}
