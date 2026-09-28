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
  version = "2026-09-28";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kirelagin";
    repo = "opensteuerauszug";
    rev = "00d35dc7bc5fc3b1ec0ec663cecf8f0f2e77a4da";
    hash = "sha256-/3BGzStIcHEF/4FCutMxsw4lqgUR28ZdVjdvzgEqFgI=";
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
