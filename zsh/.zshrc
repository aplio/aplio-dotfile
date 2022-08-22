autoload colors
colors
PROMPT="%{$fg[green]%}%m%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"
alias ls='ls -FG'
alias python='python3'
alias ll='ls -alFG'
alias ls='ls -FG'
alias ch='open -a "Google Chrome"'
alias c='open -a "Google Chrome"'
alias lo='open -a "logseq"'
alias l='open -a "logseq"'
alias sl='open -a "Slack"'
alias s='open -a "Slack"'
export PATH=$PATH:/usr/local/go/bin:/Users/rn-484/go/bin:`go env GOPATH`/bin/:
export PATH=$HOME/.nodebrew/current/bin:$PATH
export TERM=xterm

fpath=(/path/to/homebrew/share/zsh-completions $fpath)

# editor
alias emacs='emacs -nw'
alias vi="nvim"

## git
alias g='cd `ghq root`/`ghq list | fzf --preview "tree {1}"` '
alias ggh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias p='peco'
alias poetryshell='poetry shell'
alias hp='hub pull-request -o'
alias gp='git push origin @'
alias glo='git log --oneline'
alias gis='git status'
alias issuelist='gh pr list | fzf --preview "gh pr view {1} | bat --color=always --style=grid --file-name a.md" | awk '{print $1}' | xargs gh pr view --web'
alias gt='rt=`ghq root`; result=`ls ${rt} | grep ".*/" | fzf --preview "tree ${rt}/{1}"`; cd ${rt}/${result}; tmux new-session -A -s ${result}'

## tmux
alias t='tmux attach || tmux'
alias tmr='tmux rename'
alias tn='tmux new '

alias gotest='go test ./... '

function frg() {
        query=$1
if [ $# -eq 2 ]; then
    [ -d "$1" ] && cd "$1" \
        || ( echo "'$1' is not directory!" && exit 1 )
    query=$2
fi
selected_files=`fzf --query="$query" --multi --select-1 --preview "head -n 100 {}"`
[ -n "$selected_files" ] && code `echo "$selected_files" | tr '\n' ' '`
}

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
setopt share_history
alias frg='frg'
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.fzf/bin/:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
