{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    acpi
    age
    alacritty
    alejandra
    arandr
    autorandr
    baobab
    bat
    brightnessctl
    cargo
    chromium
    clipmenu
    cmatrix
    cowsay
    cups
    curlie
    dig
    direnv
    docker
    docker-compose
    dunst
    element-desktop
    eog
    evince
    eza
    fastfetch
    fd
    feh
    firefox-devedition-bin
    flameshot
    fzf
    gcc
    gimp
    git
    glow
    gnome-themes-extra
    gnumake
    gnupg
    gopass
    gource
    htop
    inotify-tools
    jetbrains.idea-community
    jetbrains.rust-rover
    jq
    just
    killall
    lolcat
    magic-wormhole
    nautilus
    networkmanagerapplet
    nh
    paper-gtk-theme
    paper-icon-theme
    pavucontrol
    polybarFull
    redshift
    ripgrep
    rofi
    rsync
    ruby
    rustup
    signal-desktop
    simple-scan
    sl
    solaar
    spotify
    spotify-cli-linux
    starship
    telegram-desktop
    texliveFull
    thefuck
    thunderbird
    tmux
    tokei
    unclutter
    upower
    usbutils
    vlc
    wget
    xdotool
    xorg.xkill
    xsel
    yq
    zsh

    # Overrides
    (i3lock-fancy-rapid.overrideAttrs {
      propagatedBuildInputs = [i3lock-color];

      postPatch = ''
        substituteInPlace i3lock-fancy-rapid.c \
          --replace '"i3lock"' '"${i3lock-color}/bin/i3lock-color"'
      '';
    })

    # Neovim
    lua-language-server
    neovim
    nodejs
    bash-language-server
    nodePackages.typescript-language-server
    nodePackages.vls
    nodePackages.vscode-json-languageserver
    rubocop
    rubyPackages.solargraph
    rubyPackages.rexml
    rufo
    rust-analyzer
    texlab
    tree-sitter
    vscode-langservers-extracted
  ];

  environment.sessionVariables = rec {
    EDITOR = "nvim";
    FLAKE = "/home/seims/.config/nixos";
    GTK_THEME = "Adwaita-dark";
    COMPOSE_HTTP_TIMEOUT = 86400;
  };

  environment.etc = {
    "modprobe.d/hid_apple.conf".text = "options hid_apple fnmode=0";
    "modprobe.d/no_beep.conf".text = "blacklist pcspkr";
  };
}
