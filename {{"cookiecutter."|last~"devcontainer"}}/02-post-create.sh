#/bin/bash

echo "Running .devcontainer/02-post-create.sh script..."
echo "Current working directory: $(pwd)"


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
echo "plugins=(git zsh-completions)" >> ~/.zshrc

echo "plugins=(git)" >> ~/.bashrc
echo "if [ -f /usr/share/bash-completion/bash_completion ]; then" >> ~/.bashrc
echo "    . /usr/share/bash-completion/bash_completion" >> ~/.bashrc
echo "fi" >> ~/.bashrc
