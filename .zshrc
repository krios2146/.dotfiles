export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

zmodload zsh/zprof

ZSH_THEME="krios2146"

plugins=(
    git
    virtualenv
    docker
    python
    archlinux
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
)

export PYTHON_AUTO_VRUN=true

source $ZSH/oh-my-zsh.sh # End of the oh-my-zsh config

# Start of the zsh config
export CATALINA_HOME=/opt/apache-tomcat-9.0.84
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$JAVA_HOME/bin"

alias df='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dbw='dune build -w'
alias dt='dune runtest'

eval "$(zoxide init --cmd cd zsh)"
eval "$(ssh-agent -s)" > /dev/null 2>&1

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; 

if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then
    . "${___MY_VMOPTIONS_SHELL_FILE}"; 
fi

export FZF_DEFAULT_OPTS='
  --color=bg:#0e1419,fg:#e5e1cf,fg+:#e5e1cf,bg+:8
  --color=prompt:3,pointer:2,marker:3
  --color=info:6,spinner:5,header:6
  --color=hl:2,hl+:2:bold
  --tmux=80%
  --preview="cat {}"
  --preview-border=left
  --bind="?:toggle-preview"
'

fzf_file_search() {
  local file
  file=$(fd --type f . ~/ 2>/dev/null | fzf) || return
  LBUFFER+="nvim $file"
}

zle -N fzf_file_search

bindkey '^F' fzf_file_search

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/krios2146/.dart-cli-completion/zsh-config.zsh ]] && . /home/krios2146/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/krios2146/.opam/opam-init/init.zsh' ]] || source '/home/krios2146/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

source ~/perl5/perlbrew/etc/bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/home/krios2146/.bun/_bun" ] && source "/home/krios2146/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(/home/krios2146/.local/bin/mise activate zsh)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# zprof

export OLLAMA_GPU_OVERHEAD=536870912
