#!/bin/bash

nvim_config_path=~/.config/nvim
nvim_config_url=https://github.com/literaryno4/Neovim.git
nvim_install_url_deb=https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
OS=debian

update() {
	sudo apt update && sudo apt upgrade;
}

install_zsh() {
	if [ ! -e "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
        echo "installing zsh..."
		sudo apt install zsh;
		sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi

	# config
	rm "~/.zshrc"
	cp "./.zshrc" ~

    # zsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	source "~/.zshrc"
}

install_neovim() {
	# install
	if [ $OS = "debian" && ! -e "/usr/bin/nvim" ]; then
		wget "$nvim_install_url_deb";
		sudo dpkg -i nvim-linux64.deb;
		rm nvim-linux64.deb*;
	fi

	# install config dependencies
	sudo apt install zip npm universal-ctags global ripgrep clang

	# config
	if [ ! -d "${nvim_config_path}" ]; then
		echo "install nvim config..."
		mkdir -p "$nvim_config_path";
		git clone "$nvim_config_url" $nvim_config_path;
	fi
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install_env() {
	update;
	install_zsh;
	install_neovim;
    update;
}

install_env;
