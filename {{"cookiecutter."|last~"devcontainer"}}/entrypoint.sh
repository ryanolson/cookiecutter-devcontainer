#!/bin/bash -x

if [ -f /workspace/.devcontainer/.user ]; then
    export $(grep -v '^#' /workspace/.devcontainer/.user | xargs)
fi

env | grep DEV

# Get the host user, group ID, username, and group name
USER_ID=${DEV_UID:-9001}
GROUP_ID=${DEV_GID:-9001}
USERNAME=${DEV_USER:-coder}
GROUPNAME=${DEV_GROUP:-coder}

# Create the group inside the container if it doesn't exist
if ! getent group $GROUP_ID > /dev/null 2>&1; then
    groupadd -g $GROUP_ID $GROUPNAME
fi

# Create the user inside the container if it doesn't exist
if ! id -u $USER_ID > /dev/null 2>&1; then
    useradd -u $USER_ID -g $GROUP_ID -o -m $USERNAME
fi

# Add the user to sudoers with passwordless sudo
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME

# Set permissions for the volume directory
# Replace /path/to/volume with the actual volume path you want to set permissions for
VOLUME_PATH="/path/to/volume"
if [ -d "$VOLUME_PATH" ]; then
    chown -R $USERNAME:$GROUPNAME $VOLUME_PATH
    chmod -R g+rwx $VOLUME_PATH
fi

# Execute the original command as the specified user
exec /usr/local/bin/gosu $USERNAME "$@"
