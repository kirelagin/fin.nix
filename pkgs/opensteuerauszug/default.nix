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
  version = "2026-04-30";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vroonhof";
    repo = "opensteuerauszug";
    rev = "811bb2fa7b3ccfaaa98700535ccc695ceb7bd20a";
    hash = "sha256-hG0NBvZ2cw2H9wI/zZzcLqRuC374m7GflUpg39GGZOo=";
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
