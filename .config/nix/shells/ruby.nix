{
  # Pin nixpkgs to prevent library paths from changing after NixOS updates.
  # To update: change the version and run `nix-prefetch-url --unpack <url>` for new sha256.
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.11.tar.gz";
    sha256 = "1s2gr5rcyqvpr58vxdcb095mdhblij9bfzaximrva2243aal3dgx";
  }) {}
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Core tools
    git      # For cloning ruby-build plugin
    rbenv    # Ruby version manager
    zsh      # Shell to exec into

    # Build tools needed for compiling Ruby and native gem extensions
    gcc        # C compiler
    gnumake    # Build system
    pkg-config # For finding library metadata
    bison      # Parser generator (required by Ruby)

    # Runtime libraries (Ruby and gems link against these)
    libffi
    libyaml
    openssl
    zlib
    readline
    gmp
    ncurses

    # Development headers (required for compilation)
    libffi.dev
    libyaml.dev
    openssl.dev
    zlib.dev
    readline.dev
    gmp.dev
    ncurses.dev
  ];

  shellHook = ''
    # Set up rbenv
    export RBENV_ROOT=$HOME/.rbenv
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"

    # Help pkg-config find library metadata files
    export PKG_CONFIG_PATH="${pkgs.lib.makeSearchPath "lib/pkgconfig" (with pkgs; [
      libffi.dev
      libyaml.dev
      openssl.dev
      zlib.dev
      readline.dev
      gmp.dev
      ncurses.dev
    ])}"

    # Tell compilers where to find libraries and headers
    export LDFLAGS="-L${pkgs.openssl.out}/lib -L${pkgs.readline.out}/lib -L${pkgs.zlib.out}/lib -L${pkgs.libffi.out}/lib -L${pkgs.libyaml}/lib -L${pkgs.gmp.out}/lib -L${pkgs.ncurses.out}/lib"
    export CPPFLAGS="-I${pkgs.openssl.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.libyaml.dev}/include -I${pkgs.gmp.dev}/include -I${pkgs.ncurses.dev}/include"

    # Tell Ruby's configure script where to find key dependencies
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${pkgs.openssl.out} --with-readline-dir=${pkgs.readline.out} --with-zlib-dir=${pkgs.zlib.out}"

    # Enable parallel compilation (uses all CPU cores)
    export MAKE_OPTS="-j $(nproc)"

    # Skip pkg-config validation during make install (avoids build failure)
    export RUBY_MAKE_INSTALL_OPTS="PKG_CONFIG=:"

    # Run Ruby environment initialization script
    source $HOME/bin/ruby-init
  '';
}
