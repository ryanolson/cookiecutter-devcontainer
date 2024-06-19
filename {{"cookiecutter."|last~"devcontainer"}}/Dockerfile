FROM {{cookiecutter.base_image}}

# Install necessary tools and dependencies
RUN apt-get update && \
    apt-get install -y curl sudo gosu zsh git wget vim-tiny bash-completion

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set the default command to sleep
CMD [ "sleep", "infinity" ]
