# SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0

final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev: {
      ibflex2 = python-final.callPackage ./pkgs/opensteuerauszug/ibflex2.nix { };
      ibind = python-final.callPackage ./pkgs/ibind { };
      opensteuerauszug = python-final.callPackage ./pkgs/opensteuerauszug { };
      pdf417gen = python-final.callPackage ./pkgs/opensteuerauszug/pdf417gen.nix { };
      pydantic-xml = python-final.callPackage ./pkgs/opensteuerauszug/pydantic-xml.nix { };
    })
  ];

  opensteuerauszug = final.python3Packages.toPythonApplication final.python3Packages.opensteuerauszug;
}
