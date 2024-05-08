{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nh
    git
    tmux
    zsh
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
    gnome.eog
    gnome.nautilus
    gnome.gnome-themes-extra
    gnome.simple-scan
    paper-gtk-theme
    paper-icon-theme
    polybarFull
    dunst
    killall
    spotify-cli-linux
    spotify
    firefox-devedition
    htop
    xorg.xkill
    networkmanagerapplet
    pavucontrol
    element-desktop
    flameshot
    clipmenu
    thunderbird
    redshift
    unclutter
    fd
    arandr
    autorandr
    xdotool
    baobab
    bat
    cmatrix
    cowsay
    lolcat
    cups
    curlie
    docker
    docker-compose
    evince
    gource
    sl
    rsync
    solaar
    tokei
    vlc
    wget
    jq
    yq
    acpi
    telegram-desktop
    signal-desktop
    (i3lock-fancy-rapid.overrideAttrs {
      propagatedBuildInputs = [i3lock-color];

      postPatch = ''
        substituteInPlace i3lock-fancy-rapid.c \
          --replace '"i3lock"' '"${i3lock-color}/bin/i3lock-color"'
      '';
    })
    ruby
    upower
    glow
    alejandra

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

  environment.etc = {
    "modprobe.d/hid_apple.conf".text = "options hid_apple fnmode=0";
    "modprobe.d/no_beep.conf".text = "blacklist pcspkr";
  };
}
