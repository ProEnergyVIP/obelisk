self: super:
let
  pkgs = self.callPackage ({ pkgs }: pkgs) { };
  inherit (pkgs.haskell.lib) dontCheck justStaticExecutables;
  inherit (pkgs.haskellPackages) callHackageDirect callHackage ghcide_1_3_0_0;

in {
  ghcide = justStaticExecutables (dontCheck ghcide_1_3_0_0);
}
