# alias
# vim
alias mvim="/Applications/MacVim.app/Contents/bin/gvim"
alias vi="nvim"
alias vim="nvim"
alias ctags="/usr/local/bin/ctags"
# python
alias p="python"
alias ip="ipython"
alias jl="jupyter lab"
# ls settings
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"
alias lsl="ls -1G"
# lisp
alias alisp="/usr/local/acl10.1.64/alisp"
alias sbcl="rlwrap sbcl"
alias clisp="rlwrap clisp"
# semi
alias semi="cd $HOME/etc/dgaku/semi"
# tmux
alias tl="tmux ls"
# kotlin compile
alias kj="java -jar $1"
# cd md dir
alias mdd="cd ~/GoogleDrive/md"
# source ~/.zshrc
alias shread="source ~/.zshrc"
# Pukiwiki to Markdown
alias m2p="md2pukiwiki"
# Kobasemi VPN Connect or Disconnct
alias kvc="networksetup -connectpppoeservice kobasemi"
alias kvd="networksetup -disconnectpppoeservice kobasemi"
# Docker Settings
alias derm="docker ps -f 'status=exited' -q | xargs docker rm -f"
alias dnrm="docker rmi $(docker images -f "dangling=true" -q)"
alias darm="docker ps -a -q | xargs docker rm -f"
alias djshell="docker run -it --rm parana/jshell jshell"
# lazygit
alias lg="lazygit"

export DISPLAY_MAC="ifconfig en0 | grep inet | awk '$1=="inet" {print $2}':0"
function startx() {
    if [ -z "$(ps -ef|grep XQuartz|grep -v grep)" ] ; then
        open -a XQuartz
        socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
    fi
}

# settings
autoload -U compinit
compinit

setopt auto_cd
function chpwd() { ls }
setopt correct
unsetopt cdable_vars

# emacs key-bind
bindkey -e

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
#setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward


# export
# ------------
# tex styfile path
export STY_PATH="/usr/local/texlive/2018/texmf-dist/tex/latex/tools/"
# tex template file path
export mdtex="/users/shinya/desktop/python/github/mdtex/temple.tex"
# md_preview_path
export MD_PRE_PATH="/Users/shinya/GoogleDrive/md"
# andoroid sdk
export PATH=$PATH:/Users/shinya/Library/Android/sdk/platform-tools
# gradle
export PATH=$PATH:/usr/local/bin/gradle
# groovy
export PATH=$PATH:/usr/local/bin/groovy
# editor
export EDITOR="nvim"

# LS_COLOR
export LS_COLORS="di=01;36"
# prompt
export PS1="%F{2}%C$%f"
#export PS1="%K{0}`echo -e "\U1F433"` %F{7}[%c]$%k%"

# gcloud
export GOOGLE_APPLICATION_CREDENTIALS=/Volumes/SD/research/julipy/googleCloudSpeechAPI/UWFproject-008e948e42d7.json
export CLOUDSDK_PYTHON=${Home}/.pyenv/versions/2.7.11/bin/python2.7
export PYTHONPATH="${HOME}/.pyenv/versions/3.5.1/lib/python3.5/site-packages:$PYTHONPATH"
export CLOUDSDK_PYTHON=/Users/shinya/.pyenv/versions/2.7.11/bin/python2.7

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

if [ -d "${PYENV_ROOT}" ]; then
   export PATH=${PYENV_ROOT}/bin:$PATH
   eval "$(pyenv init -)"
fi

## Go settings
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/go
    #export GOROOT=$( go env GOROOT )
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOPATH/bin
fi

# my functios
# ------------
# mt compdef
function mtcomp (){
        _files .
}
compdef mtcomp mt
# mkdir and cd
function mkcd(){
        mkdir $1 && cd $1
}
# Java Compile and Run
function jcr(){
        javac $1 && basename $1 .java | xargs java
}
# Markdown Viewer
function ml(){
    pandoc -s -f markdown -t html $1 | nocorrect lynx -stdin;
}
# fzf setting
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fe - edit file with default editor
fe() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# fkill - prcess kill
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
fs() {
        local addr
        local user
        addr=`cat ~/.ssh/known_hosts | awk '{print $1}' | sort |fzf`
        if [[ $addr == "" ]];then
                exit
        elif [[ $1 == "" ]];then
                /bin/echo -n "User Name >> "
                read user
                echo "ssh $user@$addr"
                ssh $user@$addr
        else
                echo "ssh $1@$addr"
                ssh $1@$addr
        fi
}

ta() {
        local session
        LF=$(printf '\\\012_')
        LF=${LF%_}

        session=`tmux ls 2>/dev/null`
        if [ $? > "0" ];then
            echo "tmux in not running"
            return
        fi

        session=`echo $session | awk '{print $1}' | sed -e 's/:$//' | gsed '$a create new session' | fzf`
        if [[ $session == "create new session" ]];then
                tmux
            elif [[ $session = "" ]];then
                echo $session
            else
                tmux attach -t $session
        fi
}

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shinya/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/shinya/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shinya/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/shinya/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

precmd() {
   pwd=$(pwd)
   cwd=${pwd##*/}
   print -Pn "\e]0;$cwd\a"
}
 
preexec() {
   printf "\033]0;%s\a" "${1%% *} | $cwd"
}
precmd () {
    vcs_info
}
RPROMPT='${vcs_info_msg_0_}'

# Tmux
#if [[ ! -n $TMUX && $- == *l* ]]; then
#  # get the IDs
#  ID="`tmux list-sessions`"
#  if [[ -z "$ID" ]]; then
#    tmux new-session
#  fi
#  create_new_session="Create New Session"
#  ID="$ID\n${create_new_session}:"
#  ID="`echo $ID | fzf | cut -d: -f1`"
#  if [[ "$ID" = "${create_new_session}" ]]; then
#    tmux new-session
#  elif [[ -n "$ID" ]]; then
#    tmux attach-session -t "$ID"
#  else
#    :  # Start terminal normally
#  fi
#fi

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in ${precmd_functions[@]}; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
