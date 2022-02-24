self: super:
let
  pkgs = self.callPackage ({ pkgs }: pkgs) { };
  inherit (pkgs.haskell.lib) dontCheck justStaticExecutables;
  inherit (pkgs.haskellPackages) callHackageDirect callHackage;

in {
  ghcide = justStaticExecutables (dontCheck (callHackage "ghcide" "1.6.0.1" {}));
}
