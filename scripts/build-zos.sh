#!/bin/sh
# Build QuickPizza for z/OS USS.
# Requires zopen SQLite: /global/zopen/usr/local/lib/libsqlite3.a
# and Go 1.25+ in PATH (source ~/.profile first).

set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)

mkdir -p "$REPO_ROOT/bin"

CGO_ENABLED=1 \
CGO_CFLAGS="-I/global/zopen/usr/local/include" \
CGO_LDFLAGS="-L/global/zopen/usr/local/lib -lsqlite3" \
LIBPATH=/usr/lib \
GOTOOLCHAIN=local \
go build \
  -mod=vendor \
  -tags libsqlite3 \
  -buildvcs=false \
  -p 2 \
  -ldflags='-s -w' \
  -o "$REPO_ROOT/bin/quickpizza" \
  "$REPO_ROOT/cmd"

echo "built: $REPO_ROOT/bin/quickpizza"
