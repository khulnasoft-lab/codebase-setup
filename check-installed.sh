#!/bin/sh

if ! command -v codebase >/dev/null 2>&1; then
  echo "codebase was not installed"
  exit 1
fi
echo "::group::📖 codebase -h"
codebase -h 2>&1 || true
echo "::endgroup::"
