# SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  hatchling,
  pytestCheckHook,

  pydantic,
  pydantic-xml,
  tomli,
  typer,
  rich,
  lxml,
  pillow,
  reportlab,
  python-barcode,
  pypdf,
  ibflex2,
  pdf417gen,
  markdown,
  platformdirs,
  requests,  # it actually _is_ a dependency even though the comment says not
  holidays,

  freezegun,
}:

buildPythonPackage (finalAttrs: {
  pname = "opensteuerauszug";
  version = "2026-07-19";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vroonhof";
    repo = "opensteuerauszug";
    rev = "9b94c7514a2621419bc888cd4729d459a910f698";
    hash = "sha256-YEn3WrGdhvXucdC2K1S/r83nKKgcjIQw3aOTPuT1nBY=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pydantic
    pydantic-xml
    tomli
    typer
    rich
    lxml
    pillow
    reportlab
    python-barcode
    pypdf
    ibflex2
    pdf417gen
    markdown
    platformdirs
    requests
    holidays
  ];

  pythonRelaxDeps = [
  ];

  checkInputs = [
    freezegun
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "opensteuerauszug" ];

  meta = {
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ kirelagin ];
  };
})
