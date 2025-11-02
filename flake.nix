
{
  description = "Luv Icon Theme";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.stdenv.mkDerivation {
        pname = "luv-icon-theme";
        version = "1.0.1";

        src = ./.;

        installPhase = ''
          mkdir -p $out/share/icons
          cp -r Luv-Dark $out/share/icons/
        '';

        meta = with pkgs.lib; {
          description = "Luv Icon Theme";
          license = licenses.gpl3;
          platforms = platforms.all;
        };
      };
  };
}
