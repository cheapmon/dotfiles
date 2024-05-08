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

        home.pointerCursor = {
          package = pkgs.paper-icon-theme;
          name = "Paper";
        };
      };
    };
  };
}
