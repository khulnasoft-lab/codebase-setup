#!/bin/sh

set -eu

VERSION="${CODEBASE_VERSION:-latest}"

TEMP="${CODEBASE_TEMPDIR}"
if [ -z "${TEMP}" ]; then
  if [ -n "${RUNNER_TEMP}" ]; then
    TEMP="${RUNNER_TEMP}"
  else
    TEMP="$(mktemp -d)"
  fi
fi

INSTALL_SCRIPT='https://raw.githubusercontent.com/khulnasoft/codebase/master/install.sh'
if [ "${VERSION}" = 'nightly' ]; then
  INSTALL_SCRIPT='https://raw.githubusercontent.com/khulnasoft/codebase-nightly/master/install.sh'
  VERSION='latest'
fi

mkdir -p "${TEMP}/khulnasoft/bin"

echo '::group::🐶 Installing codebase ... https://github.com/khulnasoft/codebase'
(
  if command -v curl 2>&1 >/dev/null; then
    curl -sfL "${INSTALL_SCRIPT}"
  elif command -v wget 2>&1 >/dev/null; then
    wget -O - "${INSTALL_SCRIPT}"
  else
    echo "curl or wget is required" >&2
    exit 1
  fi
) | sh -s -- -b "${TEMP}/codebase/bin" "${VERSION}" 2>&1
echo '::endgroup::'

echo "${TEMP}/codebase/bin" >>"${GITHUB_PATH}"
