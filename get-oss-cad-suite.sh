#!/bin/bash

wget $(curl -s https://api.github.com/repos/YosysHQ/oss-cad-suite-build/releases/latest \
  | grep browser_download_url \
  | grep linux-x64 \
  | cut -d '"' -f4)

tar -xf oss-cad-suite-linux-x64-*.tgz

echo "To activate run:"
echo "source oss-cad-suite/environment"
