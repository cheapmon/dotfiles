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
    alsa-utils
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
    difftastic
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
    ghostty
    gimp
    git
    glow
    gnome-themes-extra
    gnumake
    gnupg
    gopass
    gource
    htop
    i3lock-fancy-rapid
    inotify-tools
    jetbrains.idea-community
    jetbrains.rust-rover
    jq
    just
    kbd
    keyd
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
    postman
    redshift
    repgrep
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
    unclutter-xfixes
    upower
    usbutils
    vlc
    wget
    xdotool
    xorg.xev
    xorg.xkill
    xorg.xprop
    xsel
    yq
    zsh

    # Neovim
    lua-language-server
    neovim
    nodejs
    bash-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-json-languageserver
    rubocop
    rubyPackages.solargraph
    rubyPackages.rexml
    rufo
    rust-analyzer
    texlab
    tinymist
    tree-sitter
    typst
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
