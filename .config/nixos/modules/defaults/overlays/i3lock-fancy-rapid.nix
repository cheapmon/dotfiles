final: prev: {
  i3lock-fancy-rapid = prev.i3lock-fancy-rapid.overrideAttrs {
    propagatedBuildInputs = [prev.i3lock-color];

    postPatch = ''
      substituteInPlace i3lock-fancy-rapid.c \
        --replace '"i3lock"' '"${prev.i3lock-color}/bin/i3lock-color"'
    '';
  };
}
