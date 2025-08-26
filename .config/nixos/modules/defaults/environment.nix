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
    baobab
    bat
    brightnessctl
    cargo
    chromium
    cmatrix
    cowsay
    cups
    curlie
    dbeaver-bin
    difftastic
    dig
    direnv
    docker
    docker-compose
    element-desktop
    eog
    evince
    eza
    fastfetch
    fd
    feh
    firefox-devedition
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
    grim
    guvcview
    htop
    hypridle
    hyprlock
    hyprpaper
    inotify-tools
    jetbrains.idea-community
    jetbrains.rust-rover
    jq
    just
    kbd
    keyd
    killall
    libnotify
    lolcat
    magic-wormhole
    mako
    nautilus
    networkmanagerapplet
    nh
    pavucontrol
    pay-respects
    postman
    repgrep
    ripgrep
    rsync
    ruby
    rustup
    signal-desktop
    simple-scan
    sl
    slurp
    solaar
    spotify
    spotify-cli-linux
    swappy
    telegram-desktop
    texliveFull
    thunderbird
    tmux
    tokei
    upower
    usbutils
    vlc
    waybar
    wev
    wget
    wl-clipboard
    wlr-randr
    wlsunset
    wofi
    wofi-pass
    xdg-desktop-portal-hyprland
    yq
    zoom-us
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

    # Inputs
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # Custom packages
    (callPackage ./derivations/toml-bombadil.nix {})
  ];

  environment.gnome.excludePackages = with pkgs; [
    atomix
    cheese
    epiphany
    geary
    gedit
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori
    iagno
    tali
    totem
  ];

  environment.sessionVariables = rec {
    EDITOR = "nvim";
    NH_FLAKE = "/home/seims/.config/nixos";
    GTK_THEME = "Adwaita-dark";
    COMPOSE_HTTP_TIMEOUT = 86400;
    NIXOS_OZONE_WL = "1";
    FZF_DEFAULT_OPTS = ''
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
    '';
  };

  environment.etc = {
    "modprobe.d/hid_apple.conf".text = "options hid_apple fnmode=0";
    "modprobe.d/no_beep.conf".text = "blacklist pcspkr";
  };
}
