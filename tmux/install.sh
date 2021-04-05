DIR="$(cd "$(dirname "$0")"; pwd)";
ln -s "$DIR/tmux.conf" ~/.tmux.conf

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

