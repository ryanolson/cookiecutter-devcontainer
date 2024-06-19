FROM {{cookiecutter.base_image}}

# Install necessary tools and dependencies
RUN apt-get update && \
    apt-get install -y curl sudo gosu zsh git wget vim-tiny

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions && \
    echo "plugins=(git zsh-completions)" >> ~/.zshrc

# Set the default shell to zsh
SHELL ["/bin/zsh", "-c"]

# Set the default command to sleep
CMD [ "sleep", "infinity" ]
