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
    gitlab-runner
    rbenv
    rofi-pass
    slack
    terraform
    traefik
  ];

  environment.sessionVariables = rec {
    WORK = lib.mkForce "yes";
  };

  networking.hosts = {
    "127.0.0.1" = [
      "admin.schnellestelle.club"
      "docs.inaudito.club"
      "inaudito.club"
      "www.inaudito.club"
      "schnellestelle.club"
      "www.schnellestelle.club"
      "core.schnellestelle.club"
      "konfigurator.schnellestelle.club"
      "business.schnellestelle.club"
      "dbadmin.schnellestelle.club"
      "dbadmin.inaudito.club"
      "www.jobmixer.club"
      "assets.jobmixer.club"
      "assets-console.jobmixer.club"
      "mailhog.schnellestelle.club"
      "de.schnellestelle.club"
      "jobads.schnellestelle.club"
      "support-your-team.schnellestelle.club"
      "supportyourteam.schnellestelle.club"
      "de.jobmixer.club"
      "at.jobmixer.club"
      "pl.jobmixer.club"
      "karriereseiten.schnellestelle.club"
      "bedarfsanalyse.schnellestelle.club"
      "support-your-team.club"
      "supportyourteam.club"
      "www.support-your-team.club"
      "www.supportyourteam.club"
      "dhfk-handball.schnellestelle.club"
      "fll.schnellestelle.club"
      "flc.schnellestelle.club"
      "flb.schnellestelle.club"
      "kennen-sie-felix.schnellestelle.club"
      "syntainics-mbc.schnellestelle.club"
      "lok-leipzig.schnellestelle.club"
      "crossdeluxe.schnellestelle.club"
      "meine.schnellestelle.club"
      "images.schnellestelle.club"
      "qr-job.schnellestelle.club"
      "bewerben.schnellestelle.club"
      "spotlight.schnellestelle.club"
      "matomo.schnellestelle.club"
    ];
  };
}
