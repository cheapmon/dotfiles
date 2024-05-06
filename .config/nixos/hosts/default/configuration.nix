# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "default"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      lightdm = {
        enable = true;
        background = "/etc/login.png";

        greeters.slick = {
          enable = true;
          theme.name = "Adwaita-dark";

          iconTheme.name = "Paper";
          iconTheme.package = pkgs.paper-icon-theme;

          cursorTheme.name = "Paper";
          cursorTheme.package = pkgs.paper-gtk-theme;

          font.name = "IosevkaTerm Nerd Font";
          font.package = pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; };

          draw-user-backgrounds = true;

          extraConfig = ''
            draw-grid=true
            show-hostname=true
            show-keyboard=true
            show-clock=true
            show-quit=true
          '';
        };
      };
    };

    windowManager.i3.enable = true;
  };

  services.displayManager.defaultSession = "none+i3";

  services.picom = {
    enable = true;
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    material-icons
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.seims = {
    isNormalUser = true;
    description = "Simon Kaleschke";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nh
    git
    tmux
    oh-my-zsh
    just
    starship
    direnv
    fzf
    gcc
    gnumake
    thefuck
    eza
    ripgrep
    magic-wormhole
    fastfetch

    feh
    wezterm
    rofi
    gnome.nautilus
    gnome.gnome-themes-extra
    paper-gtk-theme
    paper-icon-theme
    (polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
    })
    dunst
    killall
    spotify-cli-linux
    spotify
    firefox-devedition
    htop
    xorg.xkill
    networkmanagerapplet

    # Neovim
    neovim
    rubyPackages.solargraph
    nodePackages.vls
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-json-languageserver
    vscode-langservers-extracted
    rubocop
    rufo
    lua-language-server
    rust-analyzer
    texlab
  ];

  environment.sessionVariables = rec {
    EDITOR = "nvim";
    FLAKE = "/home/seims/.config/nixos";
    OH_MY_ZSH = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      seims = {
        home.stateVersion = "23.11";

        home.username = "seims";
        home.homeDirectory = "/home/seims";

        home.file.".tmux/plugins/tpm" = {
          source = (fetchGit {
            url = "https://github.com/tmux-plugins/tpm.git";
            ref = "refs/heads/master";
            rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
          }).outPath;
          recursive = true;
        };
      };
    };
  };

  environment.etc = {
    "login.png" = {
      source = /home/seims/bg/login.png;
      mode = "0664";
      user = "lightdm";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
