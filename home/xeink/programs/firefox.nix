{ pkgs, c, lib, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.xeink = {
      isDefault = true;

      settings = {
        "services.sync.engine.prefs" = false;

        "browser.aboutConfig.showWarning" = false;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "browser.toolbars.bookmarks.visibility" = "never";

        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;

        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phishing.enabled" = false;
        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "signon.rememberSignons" = false;
        "toolkit.telemetry.unified" = false;

        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layers.acceleration.force-enabled" = true;
      };
    };
  };
}
