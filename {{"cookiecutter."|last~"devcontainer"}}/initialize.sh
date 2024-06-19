#!/bin/bash

echo "Running .devcontainer/initialize.sh script..."
echo "Current working directory: $(pwd)"

cat <<EOF > .devcontainer/.user
DEV_USER=$(whoami)
DEV_UID=$(id -u)
DEV_GID=$(id -g)
DEV_GROUP_NAME=$(getent group $(id -g) | cut -d: -f1)
EOF

cat .devcontainer/.user
