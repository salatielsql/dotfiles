source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH CONFIG

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

###########################################################
##################### USER CONFIG #########################
###########################################################

# ALIASES

# package managers alias
# npm
alias nr="npm run"
alias ni="npm install"
alias nu="npm uninstall"

# pnpm
alias pnr="pnpm run"
alias pni="pnpm install"
alias pnu="pnpm uninstall"

# yarn
alias y="yarn"

# bun
alias br="bun run"

# other tools
alias v="nvim"

# ls
alias ls="lsd"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'

# git
alias gw="git switch"
alias gbs="git branch | grep"
alias gbn="git switch -c"
alias gs="git push"
alias gsf="git push --force"
alias gca="git commit --amend"
function gcm() {
  if [ $1 = "" ]; then
    printf '%s\n' "git commit with message failed (gcm): Provide a commit message." >&2;
  else
    git commit -m $1
  fi
}
function gcam() {
  if [ $1 = "" ]; then
    printf '%s\n' "git commit all with message failed (gcam): Provide a commit message." >&2;
  else
    git add --all; git commit -m $1;
  fi
}
alias gp="git pull"
alias gpr="git pull --rebase origin"
alias grlc="git reset --soft HEAD~1"
alias gl="git log --oneline --decorate --color"

# other
ZSH_HOME=$HOME
alias sscf="source $ZSH_HOME/.zshrc"

# PATH EXPORT

# nvm (node version management)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# android shit
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"

# pnpm
export PATH="/opt/homebrew/opt/pnpm@8/bin:$PATH"

# deno
export DENO_INSTALL="/Users/salackl/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# FUCTIONS

# yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH=$PATH:$HOME/.maestro/bin

# bun completions
[ -s "/Users/salackl/.bun/_bun" ] && source "/Users/salackl/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# stellar CLI autocomplete
if command -v stellar >/dev/null 2>&1; then
  source <(stellar completion --shell bash)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
