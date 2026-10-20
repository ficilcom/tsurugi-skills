#!/usr/bin/env bash
# skills/<name>/ を <name>.zip にまとめる（Claude アプリへのアップロード用）。
# ZIP の中身は <name>/SKILL.md の形になる。出力先は第 1 引数、省略時は dist/。
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="${1:-$root/dist}"
mkdir -p "$out"
out="$(cd "$out" && pwd)"

cd "$root/skills"
for dir in */; do
  name="${dir%/}"
  [ -f "$name/SKILL.md" ] || continue
  rm -f "$out/$name.zip"
  zip -qr "$out/$name.zip" "$name" -x '*.DS_Store'
  echo "$out/$name.zip"
done
