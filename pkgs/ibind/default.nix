# SPDX-FileCopyrightText: 2026 Kirill Elagin <https://kir.elagin.me/>
#
# SPDX-License-Identifier: MPL-2.0

{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  setuptools,

  pycryptodome,
  requests,
  urllib3,
  websocket-client,

  pytest-mock,

  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "ibind";
  version = "0.1.23";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Voyz";
    repo = "ibind";
    tag = "v${finalAttrs.version}";
    hash = "sha256-G7H8WrS5qyHY7KXa7dxk4HIFu5CcmjNIIgY/50G/xLk=";
  };

  postUnpack = ''
    rm -r "$sourceRoot/dist"
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    pycryptodome
    requests
    urllib3
    websocket-client
  ];

  pythonRelaxDeps = [
    "requests"
    "websocket-client"
  ];

  checkInputs = [
    pytest-mock
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  disabledTestPaths = lib.optionals stdenv.hostPlatform.isDarwin [
    # On macOS the timeout seems to be less precise than the testcase expects
    "test/unit/support/test_py_utils_u.py::TestWaitUntilU::test_wait_until_timeout"
  ];

  pythonImportsCheck = [ "ibind" ];

  meta = {
    changelog = "https://github.com/Voyz/ibind/releases/tag/${finalAttrs.src.tag}";
    description = "REST and WebSocket client library for Interactive Brokers Client Portal Web API";
    homepage = "https://github.com/Voyz/ibind";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ kirelagin ];
  };
})
