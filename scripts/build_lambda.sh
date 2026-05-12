#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build/lambda"
PACKAGE_DIR="${BUILD_DIR}/package"
LAMBDA_PYTHON_VERSION="${LAMBDA_PYTHON_VERSION:-3.12}"
LAMBDA_PLATFORM="${LAMBDA_PLATFORM:-manylinux2014_x86_64}"

rm -rf "${BUILD_DIR}"
mkdir -p "${PACKAGE_DIR}" "${ROOT_DIR}/dist"

python3 -m pip install \
  --requirement "${ROOT_DIR}/src/requirements.txt" \
  --platform "${LAMBDA_PLATFORM}" \
  --implementation cp \
  --python-version "${LAMBDA_PYTHON_VERSION}" \
  --only-binary=:all: \
  --target "${PACKAGE_DIR}"

cp "${ROOT_DIR}/src/app.py" "${PACKAGE_DIR}/app.py"

echo "Staged Lambda package in ${PACKAGE_DIR}"
