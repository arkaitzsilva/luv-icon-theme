{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk3,
  xdg-utils,
}:
stdenvNoCC.mkDerivation rec {
  pname = "luv-icon-theme";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "arkaitzsilva";
    repo = "luv-icon-theme";
    rev = "${version}";
    hash = "lib.fakeSha256";
  };

  nativeBuildInputs = [
    gtk3
    xdg-utils
  ];

  installPhase = ''
    runHook preInstall

    install -d $out/share/icons/Luv-Dark
    cp -r . $out/share/icons/Luv-Dark
    gtk-update-icon-cache -f -t $out/share/icons/Luv-Dark && xdg-desktop-menu forceupdate

    runHook postInstall
  '';

  meta = with lib; {
    description = "Luv Icon Theme";
    homepage = "https://github.com/arkaitzsilva/luv-icon-theme";
    license = with licenses; [ gpl3Only ];
    platforms = platforms.linux;
    maintainers = with maintainers; [ arkaitzsilva ];
  };
}
