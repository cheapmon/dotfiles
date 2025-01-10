final: prev: {
  spotify-cli-linux = prev.spotify-cli-linux.overrideAttrs {
    version = "1.9.1";

    src = prev.fetchPypi {
      version = "1.9.1";
      pname = "spotify-cli-linux";
      hash = "sha256-Sey4ovSKqyN2SmALzwpSnlVO6HWHbawRm3irgR5tMK4=";
    };
  };
}
