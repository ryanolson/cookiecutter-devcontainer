#/bin/bash

echo "Running .devcontainer/00-on-create.sh script..."
echo "Current working directory: $(pwd)"

echo "*** Creating .user file with user-specific information..."

cat <<EOF > .devcontainer/.user
DEV_USER=$(whoami)
DEV_UID=$(id -u)
DEV_GID=$(id -g)
DEV_GROUP_NAME=$(getent group $(id -g) | cut -d: -f1)
EOF

cat .devcontainer/.user
