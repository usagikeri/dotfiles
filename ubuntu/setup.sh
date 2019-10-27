# apt
# =========================
sudo apt update
sudo apt upgrade -y
# =========================

# zsh
# =========================
sudo apt install -y zsh
chsh -s /usr/bin/zsh
# =========================

# linux brew
# =========================
sudo apt install -y linuxbrew-wrapper

echo 'export PATH="/home/k598254/.linuxbrew/bin:$PATH"' >> ~/.zshrc
echo ''
echo 'PATH="$HOME/.linuxbrew/bin:$PATH"'
echo 'export MANPATH="$(brew --prefix)/share/man:$MANPATH"'
echo 'export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"'

source ~/.zshrc
brew update
# =========================

# install fzf
# =========================
brew install -y  fzf
echo 'export PATH=$PATH:~/.linuxbrew/opt/fzf/bin' >> ~/.zshrc
source ~/.zshrc
# =========================

# install neovim
# =========================
udo apt install -y  build-essential \
                    libbz2-dev \
                    libdb-dev \
                    libreadline-dev \
                    libffi-dev \
                    libgdbm-dev \
                    liblzma-dev \
                    libncursesw5-dev \
                    libsqlite3-dev \
                    libssl-dev \
                    zlib1g-dev \
                    uuid-dev \
                    tk-dev

brew install pyenv

echo 'export PYENV_ROOT=$HOME/.pyenv' >> ~/.zshrc
echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> ~/.zshrc

echo 'if [ -d "${PYENV_ROOT}" ]; then
   export PATH=${PYENV_ROOT}/bin:$PATH
   eval "$(pyenv init -)"
fi' >> ~/.zshrc
source ~/.zshrc

pyenv install 3.7.1
pyenv global 3.7.1

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt -y install neovim
# =========================

# vim-plug
# =========================
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# =========================

# install go
# =========================
wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.13.1.linux-amd64.tar.gz
echo 'export PATH=”/usr/lib/go-1.10/bin:$PATH”' >> ~/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
rm -rf go1.13.1.linux-amd64.tar.gz
# =========================

# Tmux
# =========================
sudo apt update
sudo apt install -y build-essential automake libevent-dev ncurses-dev bison
mkdir -p $HOME/src
mkdir -p $HOME/bin
cd $HOME/src && git clone https://github.com/tmux/tmux.git
cd $HOME/src/tmux && sh autogen.sh && ./configure && make
sudo cp $HOME/src/tmux/tmux /usr/bin/

rm -rf $HOME/src
rm -rf $HOME/bin

# tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# plugin install -> prefix + I
# =========================

# install ctags
# =========================
sudo apt -y install ctags
# =========================

# install docker
# =========================
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# =========================

# install gVisor
# =========================
wget https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc
wget https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc.sha512
sha512sum -c runsc.sha512
chmod +x runsc
sudo mv runsc /usr/local/bin

sudo touch /etc/docker/daemon.json
sudo echo '{' > /etc/docker/daemon.json
sudo echo '"runtimes": {' > /etc/docker/daemon.json
sudo echo '"runsc": {' > /etc/docker/daemon.json
sudo echo '"path": "/usr/local/bin/runsc"' > /etc/docker/daemon.json
sudo echo '    }' > /etc/docker/daemon.json
sudo echo '  }' > /etc/docker/daemon.json
sudo echo '}' > /etc/docker/daemon.json
sudo systemctl restart docker
# =========================
