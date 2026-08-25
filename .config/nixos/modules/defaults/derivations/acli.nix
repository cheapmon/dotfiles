{
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation {
  name = "acli";
  src = fetchurl {
    url = "https://acli.atlassian.com/linux/latest/acli_linux_amd64/acli";
    sha256 = "5Pb5H/b1BFScHAug3eYqzX/aPqTAcSoRsvKSd1Hlk2Y=";
  };
  unpackPhase = ''
    runHook preUnpack
    runHook postUnpack
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src $out/bin/acli
    chmod +x $out/bin/acli

    runHook postInstall
  '';
}
