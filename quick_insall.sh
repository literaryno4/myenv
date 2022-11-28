#!/bin/bash

nvim_config_path=~/.config/nvim
nvim_config_url=https://github.com/literaryno4/Neovim.git
nvim_install_url_deb=https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
OS=debian

update() {
	sudo apt update && sudo apt upgrade;
}

intall_dependencies() {
	# install config dependencies
	sudo apt install zip npm universal-ctags global ripgrep llvm tmux

}

install_zsh() {
	if [ ! -e "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
        echo "installing zsh..."
		sudo apt install zsh;
		sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi

    # zsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

install_neovim() {
	# install
	if [ $OS = "debian" ] && [ ! -e "/usr/bin/nvim" ]; then
		wget "$nvim_install_url_deb";
		sudo dpkg -i nvim-linux64.deb;
		rm nvim-linux64.deb*;
	fi

	# config
	if [ ! -d "${nvim_config_path}" ]; then
		echo "install nvim config..."
		mkdir -p "$nvim_config_path";
		git clone -b terminal "$nvim_config_url" $nvim_config_path;
	fi
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

link_config() {
	path=$(pwd)
	for dotfile in $(cd dotfiles; find . -name '.*' | grep -v .git | grep -v '^.$');
	do
		bn=$(basename ${dotfile})
		ln -sf ${path}/dotfiles/${bn} $HOME/${bn}
	done
}

install_env() {
	install_zsh;
	install_neovim;
	link_config;
}

install_env;
