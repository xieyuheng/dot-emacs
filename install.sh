#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEPS_DIR="$SCRIPT_DIR/../deps"

cd "$SCRIPT_DIR"

cp init.el ~/.emacs.d/init.el

echo "[deps] installing dependencies..."

mkdir -p "$DEPS_DIR"

while IFS= read -r url; do
  url="${url%"${url##*[![:space:]]}"}"
  url="${url#"${url%%[![:space:]]*}"}"
  [ -z "$url" ] && continue
  name=$(basename "$url" .git)
  name=${name%/}
  if [ -d "$DEPS_DIR/$name" ]; then
    echo "  [update] $name"
    (cd "$DEPS_DIR/$name" && git pull --ff-only)
  else
    echo "  [clone] $name"
    git clone "$url" "$DEPS_DIR/$name"
  fi
done < manifest.txt

echo "[deps] done"
