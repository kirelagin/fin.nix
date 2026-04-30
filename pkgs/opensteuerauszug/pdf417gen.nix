# SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  setuptools,
  setuptools-scm,
  pytestCheckHook,

  pillow,

  mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "pdf417gen";
  version = "2026-04-30";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ihabunek";
    repo = "pdf417-py";
    rev = "c163f2a6af8d159a54c56c431da6cc642c1c98b6";
    hash = "sha256-x3W9rUazg9rP1nqV6gBTAD79oqninK5U9q4mjCMAEc0=";
  };

  build-system = [ setuptools setuptools-scm ];

  SETUPTOOLS_SCM_PRETEND_VERSION = "0.8.1.dev+g${lib.substring 0 7 finalAttrs.src.rev}";

  dependencies = [
    pillow
  ];

  pythonRelaxDeps = [
  ];

  checkInputs = [
    mock
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pdf417gen" ];

  meta = {
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ kirelagin ];
  };
})
