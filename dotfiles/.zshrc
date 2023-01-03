myenv="${HOME}/myenv"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source ${myenv}/zshrc_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	source ${myenv}/zshrc_macos.sh
fi

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && \
        [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        exec tmux
fi
export NEMU_HOME='/home/chao/ics2022/nemu'
export AM_HOME='/home/chao/ics2022/abstract-machine'
export AMT='/home/chao/ics2022/am-kernels/tests/am-tests'
export CPUT='/home/chao/ics2022/am-kernels/tests/CPU-tests'
