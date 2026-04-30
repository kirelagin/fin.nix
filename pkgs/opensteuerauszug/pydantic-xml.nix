# SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  poetry-core,
  pytestCheckHook,

  lxml,
  pydantic,
  pydantic-core,

  xmldiff,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydantic-xml";
  version = "2.20.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dapper91";
    repo = "pydantic-xml";
    tag = "v${finalAttrs.version}";
    hash = "sha256-du1KYDfEnjfvit6dY8QNX0RjkFoD84TboQPvgTd2uJA=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    lxml
    pydantic
    pydantic-core
  ];

  pythonRelaxDeps = [
  ];

  checkInputs = [
    xmldiff
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pydantic_xml" ];

  meta = {
    license = lib.licenses.unlicense;
    maintainers = with lib.maintainers; [ kirelagin ];
  };
})
