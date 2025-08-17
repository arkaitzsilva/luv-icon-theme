
{
  description = "Luv Icon Theme";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.stdenv.mkDerivation {
        pname = "Luv-Icon-Theme";
        version = "1.0";

        src = ./.;

        installPhase = ''
          mkdir -p $out/share/icons
          cp -r Luv-Dark $out/share/icons/
        '';

        meta = with pkgs.lib; {
          description = "Luv Icon Theme";
          license = licenses.gpl3; # o la que corresponda
          platforms = platforms.all;
        };
      };
  };
}
