export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

ZDOTDIR_MAIN="${${(%):-%x}:A:h}"
source "$ZDOTDIR_MAIN/public/osdiab/zshrc.zsh"
source "$ZDOTDIR_MAIN/personal.zsh"

# Created by `pipx` on 2024-11-26 06:27:23
export PATH="$PATH:/Users/omardiab/.local/bin"

# pnpm
export PNPM_HOME="/Users/omardiab/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

