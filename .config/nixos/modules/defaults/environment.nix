{
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
    appimage-run
    baobab
    bat
    brightnessctl
    cargo
    chromium
    cmatrix
    cowsay
    curlie
    delta
    dex
    difftastic
    dig
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
    google-chrome
    gopass
    gource
    guvcview
    grim
    htop
    hypridle
    hyprlock
    hyprpaper
    inotify-tools
    jq
    just
    kbd
    keyd
    killall
    libnotify
    libreoffice
    lolcat
    magic-wormhole
    mako
    nautilus
    networkmanagerapplet
    obs-studio
    opencode
    openssl
    pavucontrol
    pinentry-tty
    postman
    repgrep
    ripgrep
    rsync
    shikane
    signal-desktop
    simple-scan
    sl
    slurp
    spotify
    spotify-cli-linux
    starship
    swappy
    telegram-desktop
    thunderbird
    tokei
    unzip
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
    yq
    zellij
    zoxide

    # Lua
    lua55Packages.luafilesystem

    # Neovim
    bash-language-server
    lua-language-server
    neovim
    typescript-language-server
    nodejs
    rust-analyzer
    taplo
    texlab
    tinymist
    tree-sitter
    typst
    typstyle
    vscode-langservers-extracted

    # Inputs
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Custom packages + overrides
    (callPackage ./_derivations/toml-bombadil.nix {})
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "sapphire";
    })
  ];

  environment.gnome.excludePackages = with pkgs; [
    atomix
    cheese
    epiphany
    geary
    gedit
    gnome-characters
    gnome-music
    gnome-terminal
    gnome-tour
    hitori
    iagno
    loupe
    shotwell
    tali
    totem
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    COMPOSE_HTTP_TIMEOUT = 86400;
    NIXOS_OZONE_WL = "1";
    FZF_DEFAULT_OPTS = ''
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
    '';
    LUA_CPATH = "${pkgs.lua55Packages.luafilesystem}/lib/lua/5.5/?.so;;";
    HY3_PLUGIN = "${inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3}/lib/libhy3.so";
  };
}
