{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ansible
    # beekeeper-studio
    # bruno
    # bruno-cli
    claude-code
    claude-code-acp
    codebuff
    codex
    csvlens
    gitlab-runner
    glab
    slack
    sqlite
    terraform
    traefik
  ];

  environment.sessionVariables = rec {
    WORK = lib.mkForce "yes";
  };

  # Allow traefik to bind to privileged ports (80, 443) without root
  security.wrappers.traefik = {
    owner = "root";
    group = "root";
    capabilities = "cap_net_bind_service+ep";
    source = "${pkgs.traefik}/bin/traefik";
  };

  networking.hosts = {
    "127.0.0.1" = [
      "admin.schnellestelle.club"
      "assets-console.jobmixer.club"
      "assets.jobmixer.club"
      "at.jobmixer.club"
      "bedarfsanalyse.schnellestelle.club"
      "bewerben.schnellestelle.club"
      "business.schnellestelle.club"
      "core.schnellestelle.club"
      "crossdeluxe.schnellestelle.club"
      "dbadmin.inaudito.club"
      "dbadmin.schnellestelle.club"
      "de.jobmixer.club"
      "de.schnellestelle.club"
      "dhfk-handball.schnellestelle.club"
      "docs.inaudito.club"
      "flb.schnellestelle.club"
      "flc.schnellestelle.club"
      "fll.schnellestelle.club"
      "images.schnellestelle.club"
      "inaudito.club"
      "jobads.schnellestelle.club"
      "karriereseiten.schnellestelle.club"
      "kennen-sie-felix.schnellestelle.club"
      "konfigurator.schnellestelle.club"
      "lok-leipzig.schnellestelle.club"
      "mailhog.schnellestelle.club"
      "meine.schnellestelle.club"
      "pl.jobmixer.club"
      "qr-job.schnellestelle.club"
      "schnellestelle.club"
      "spotlight.schnellestelle.club"
      "support-your-team.club"
      "support-your-team.schnellestelle.club"
      "supportyourteam.club"
      "supportyourteam.schnellestelle.club"
      "syntainics-mbc.schnellestelle.club"
      "www.inaudito.club"
      "www.jobmixer.club"
      "www.schnelle-stelle.club"
      "www.schnellestelle.club"
      "www.support-your-team.club"
      "www.supportyourteam.club"
    ];

    "192.168.178.222" = [
      "ci-alpha"
    ];
  };

  home-manager.users.seims = {
    systemd.user.services.traefik-ia = {
      Unit = {
        Description = "Traefik proxy for IN AUDITO applications";
        After = ["network.target"];
      };

      Service = {
        Type = "simple";
        WorkingDirectory = "/home/seims/git/architecture/apps/ci/traefik";
        EnvironmentFile = "/home/seims/.ia.architecture.env";
        # Use security wrapper at /run/wrappers/bin/traefik which has CAP_NET_BIND_SERVICE
        ExecStart = "/run/wrappers/bin/traefik --configFile traefik.yml";
        Restart = "on-failure";
        RestartSec = "5s";
      };

      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
