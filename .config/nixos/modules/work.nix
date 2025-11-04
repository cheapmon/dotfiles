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
    bruno
    bruno-cli
    claude-code
    codebuff
    codex
    gitlab-runner
    rbenv
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
  };
}
