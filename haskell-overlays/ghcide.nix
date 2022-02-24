self: super:
let
  pkgs = self.callPackage ({ pkgs }: pkgs) { };
  inherit (pkgs.haskell.lib) dontCheck justStaticExecutables;
  inherit (pkgs.haskellPackages) callHackageDirect callHackage;

in {
  ghcide = justStaticExecutables (dontCheck (callHackageDirect {
    pkg = "ghcide";
    ver = "1.5.0.1";
    sha256 = "ec0970df3e04283f0ad74b957720090ddeb900ce0b3d6c997a6c466e6ec2ce7c";
  } rec {
    lsp-test = dontCheck (callHackage "lsp-test" "0.14.0.0" { });
  }));
}
