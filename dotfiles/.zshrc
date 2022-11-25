myenv="${HOME}/myenv"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source ${myenv}/zshrc_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	source ${myenv}/zshrc_macos.sh
fi
