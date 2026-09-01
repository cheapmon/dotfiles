{
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation {
  name = "toml-bombadil";
  src = fetchurl {
    url = "https://github.com/oknozor/toml-bombadil/releases/download/4.2.0/bombadil-4.2.0-x86_64-unknown-linux-musl.tar.gz";
    sha256 = "1959ypgv9yxfdg72n4bfx32qgiphzp4093liv9l0aaz5c8glf081";
  };
  unpackPhase = ''
    runHook preUnpack

    tar --extract --file=$src

    runHook postUnpack
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp x86_64-unknown-linux-musl/bombadil $out/bin/bombadil
    chmod +x $out/bin/bombadil

    runHook postInstall
  '';
}
