self: super:
let
  pkgs = self.callPackage ({ pkgs }: pkgs) { };
  inherit (pkgs.haskell.lib) dontCheck justStaticExecutables;
  inherit (pkgs.haskellPackages) callHackageDirect callHackage;

in {
  ghcide = justStaticExecutables (dontCheck (callHackageDirect {
    pkg = "ghcide";
    ver = "0.2.0";
    sha256 = "199l4qzrghhz6wbfkgqdl4gll4wvgpr190kinzhv88idnn9pxm96";
  } rec {
    lsp-test = dontCheck (callHackage "lsp-test" "0.14.0.0" { });
  }));
}
