{
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation {
  name = "acli";
  src = fetchurl {
    url = "https://acli.atlassian.com/linux/latest/acli_linux_amd64/acli";
    sha256 = "se4xxM9NG0ko/ThUSoMpzNSxAB/r+9iO4jpId2fLHKg=";
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
