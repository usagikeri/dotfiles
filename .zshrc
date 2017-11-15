# alias
# ------------
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"
alias e="emacs"
alias p="python"
alias ip="ipython"
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"
alias alisp="/usr/local/acl10.1.64/alisp"
alias semi="cd /Volumes/SD/dgaku/semi"
alias log="python /Volumes/SD/dgaku/study_log/html/out.py"
alias julites="julius -C ~/Desktop/julipy/filtaring/dictationKit4.3.1/00con.jconf"
alias tl="tmux ls"
alias kj="java -jar $1"

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
# editor
export EDITOR="/usr/local/bin/vim"
# prompt
export PS1="%F{3}%C$%f"
# gcloud
export CLOUDSDK_PYTHON=${Home}/.pyenv/versions/2.7.11/bin/python2.7  
export PYTHONPATH="${HOME}/.pyenv/versions/3.5.1/lib/python3.5/site-packages:$PYTHONPATH"
# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
   export PATH=${PYENV_ROOT}/bin:$PATH
   eval "$(pyenv init -)"
fi

# own functios
# ------------
# Markdown Viewer
function ml(){
    pandoc -s -f markdown -t html $1 | nocorrect lynx -stdin;
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/Desktop/julipy/googleCloudSpeechAPI/google-cloud-sdk/path.zsh.inc' ]; then source '${HOME}/Desktop/julipy/googleCloudSpeechAPI/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/Desktop/julipy/googleCloudSpeechAPI/google-cloud-sdk/completion.zsh.inc' ]; then source '${HOME}/Desktop/julipy/googleCloudSpeechAPI/google-cloud-sdk/completion.zsh.inc'; fi

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
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
