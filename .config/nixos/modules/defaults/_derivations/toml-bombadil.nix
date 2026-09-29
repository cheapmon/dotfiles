{
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation rec {
  pname = "toml-bombadil";
  version = "4.2.0";
  src = fetchurl {
    url = "https://github.com/oknozor/toml-bombadil/releases/download/${version}/bombadil-${version}-x86_64-unknown-linux-musl.tar.gz";
    sha256 = "1959ypgv9yxfdg72n4bfx32qgiphzp4093liv9l0aaz5c8glf081";
  };
  installPhase = ''
    runHook preInstall

    install -Dm755 bombadil $out/bin/bombadil

    runHook postInstall
  '';
}
