#!/usr/bin/env bash
set -e

apt update

apt install -y \
  curl \
  git \
  build-essential \
  python3 \
  python3-pip \
  python3-venv \
  nodejs \
  npm

if ! command -v codex >/dev/null 2>&1; then
  npm install -g @openai/codex
fi

chown -R vagrant:vagrant /home/vagrant/.codex 2>/dev/null || true

echo "Done. Test with: codex --version"
