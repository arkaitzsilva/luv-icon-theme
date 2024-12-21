{
  description = "Luv-Dark Icon Theme";

  outputs = { self, nixpkgs, ... }: {
    packages.x86_64-linux.luv-icon-theme = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in pkgs.stdenv.mkDerivation {
      name = "luv-dark-icon-theme";
      src = ./.;
      installPhase = ''
        mkdir -p $out/share/icons
        cp -r Luv-Dark $out/share/icons/
      '';
      meta = with pkgs.lib; {
        description = "luv-icon-theme";
        homepage = "https://github.com/arkaitzsilva/luv-icon-theme";
        license = licenses.gpl3Plus;
        maintainers = [ maintainers.arkaitzsilva ];
      };
    };
  };
}

