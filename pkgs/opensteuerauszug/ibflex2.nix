# SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  setuptools,
  pytestCheckHook,

  defusedxml,

  hypothesis,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "ibflex2";
  version = "2026-04-30";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vroonhof";
    repo = "ibflex";
    rev = "9022e37b86bdb463755082dee5b073af2721c16b";
    hash = "sha256-o9ocUwvcbWMj4rfIiIhQj7vo8Z2Wf15RvnLXzFSRq5c=";
  };

  build-system = [ setuptools ];

  dependencies = [
    defusedxml
  ];

  pythonRelaxDeps = [
  ];

  checkInputs = [
    hypothesis
    requests
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "ibflex" ];

  meta = {
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ kirelagin ];
  };
})
