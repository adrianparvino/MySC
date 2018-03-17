nixpkgs: ghc: ghcjs: {
  packageOverrides = pkgs: rec {
    webkitgtk = pkgs.webkitgtk216x;  
    hpkgs = pkgs.haskell.packages.${ghc}.override {
      overrides = self: super: {
        mysc-common = self.callPackage ./mysc-common { haskellPackages = self; };
        mysc-server = self.callPackage ./mysc-server { haskellPackages = self; };

        hlint = self.callPackage ./pkgs/hlint.nix {};
        jsaddle = self.callPackage ./pkgs/jsaddle.nix {};
        text = self.callPackage ./pkgs/text.nix {};
        aeson = self.callPackage ./pkgs/aeson.nix {};
        bytestring-builder = pkgs.haskell.lib.dontHaddock super.bytestring-builder;
        nats = pkgs.haskell.lib.dontHaddock super.nats;

        reflex-dom-contrib = self.callPackage ./pkgs/reflex-dom-contrib.nix {};

        reflex-bulma = self.callPackage /home/myrl/Development/reflex-bulma {};
        reflex = self.callPackage (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex";
          rev = "4a03273794aa4c9a9965e3e6a45fa3c68fa4659a";
          sha256 = "0iwn5vjqk4nrxy0ihyrhxirlwbabs7dcr7wkvd0h6rw4yap7ay8p";
        }) {};
      } // (import (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex-dom";
          rev = "df9fff3a0f4e393db6af0beecabd38156c82aedc";
          sha256 = "04zb388xdiarpilr0q0b3pb34h6dycr7y0jgrb3q4zx4dbksq7br";
      }) self nixpkgs);
    };
    hjspkgs = pkgs.haskell.packages.${ghcjs}.override {
      overrides = self: super: {
        mysc-common = self.callPackage ./mysc-common { haskellPackages = self; };
        mysc-client = self.callPackage ./mysc-client { haskellPackages = self; };

        hlint = self.callPackage ./pkgs/hlint.nix {};
        jsaddle = self.callPackage ./pkgs/jsaddle.nix {};
        text = self.callPackage ./pkgs/text.nix {};
        aeson = self.callPackage ./pkgs/aeson.nix {};
        bytestring-builder = pkgs.haskell.lib.dontHaddock super.bytestring-builder;
        nats = pkgs.haskell.lib.dontHaddock super.nats;
        reflex-dom-contrib = self.callPackage ./pkgs/reflex-dom-contrib.nix {};

        reflex-bulma = self.callPackage /home/myrl/Development/reflex-bulma {};
        reflex = self.callPackage (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex";
          rev = "4a03273794aa4c9a9965e3e6a45fa3c68fa4659a";
          sha256 = "0iwn5vjqk4nrxy0ihyrhxirlwbabs7dcr7wkvd0h6rw4yap7ay8p";
        }) {};
      } // (import (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex-dom";
          rev = "df9fff3a0f4e393db6af0beecabd38156c82aedc";
          sha256 = "04zb388xdiarpilr0q0b3pb34h6dycr7y0jgrb3q4zx4dbksq7br";
      }) self nixpkgs);
    };
  };
}
