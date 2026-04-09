{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "9.0.0";
      OLLAMA_MAX_LOADED_MODELS = "1";
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  virtualisation.oci-containers.containers."open-webui" = {
    image = "ghcr.io/open-webui/open-webui:main";
    ports = [ "3000:8080" ];
    environment = {
      "OLLAMA_BASE_URL" = "http://127.0.0.1:11434";
      "WEBUI_SECRET_KEY" = "nixosxnkollamaservice";
    };
    extraOptions = [ "--network=host" ];
  };

  environment.systemPackages = with pkgs; [
    oterm
    nvtopPackages.amd
  ];
}
