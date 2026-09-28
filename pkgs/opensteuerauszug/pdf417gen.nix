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
  version = "0-unstable-2026-05-01";
  pyproject = true;

  src = fetchFromGitHub {
    #owner = "ihabunek";
    owner = "vroonhof";
    repo = "pdf417-py";
    rev = "44ce800bf7301ea88aaabd2e1a680238c96fc4a9";
    hash = "sha256-9PVFnJ5lDhzN9bYuDa6F5rAYDs7QUsSJWRkUQ1FvTJ0=";
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
