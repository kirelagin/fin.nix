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
  version = "2026-09-25";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vroonhof";
    repo = "opensteuerauszug";
    rev = "eeb3b3d790c5ba9c8cd2e256d228d0bae62ec572";
    hash = "sha256-FilM7/ACD4KAwF+HvA5KAYMneyDjWxM2QB5py7GqgQM=";
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
