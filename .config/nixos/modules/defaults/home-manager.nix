{
  config,
  pkgs,
  inputs,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      seims = {
        home.stateVersion = "23.11";

        home.username = "seims";
        home.homeDirectory = "/home/seims";

        home.file.".tmux/plugins/tpm" = {
          source =
            (fetchGit {
              url = "https://github.com/tmux-plugins/tpm.git";
              ref = "refs/heads/master";
              rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
            })
            .outPath;
          recursive = true;
        };

        services.mako.enable = true;

        dconf = {
          enable = true;
          settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
        };

        systemd.user.services.decrypt-secrets = {
          Unit = {
            Description = "Decrypt age-encrypted secrets to runtime directory";
            After = ["default.target"];
          };

          Service = {
            Type = "oneshot";
            ExecStart = "/home/seims/bin/decrypt-secrets";
            RemainAfterExit = true;
            Environment = "PATH=/run/current-system/sw/bin:/run/wrappers/bin:/home/seims/bin";
          };

          Install = {
            WantedBy = ["default.target"];
          };
        };
      };
    };
  };
}
