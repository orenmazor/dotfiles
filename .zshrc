export GOPATH="/Users/orenmazor/opt/golang"
export HOMEBREW_GITHUB_API_TOKEN=4a9aea7cdffc955c0288bcddc2e7f26bb448c075
export EDITOR="vim"
export PYENV_ROOT="$HOME/.pyenv"
PATH="/usr/local/openssl/bin:$PYENV_ROOT/bin:$PATH:$PYENV_ROOT/shims"

# Base PATH
PATH=$PATH:/usr/local/openssl/bin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/go/bin

# Fun with SSH
if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
  if [[ "$(uname -s)" == "Darwin" ]]; then
    # We're on OS X. Try to load ssh keys using pass phrases stored in
    # the OSX keychain.
    #
    # You can use ssh-add -K /path/to/key to store pass phrases into
    # the OSX keychain
    ssh-add -k
  fi
fi

if [ -f ~/.ssh/id_rsa ]; then
  if [ $(ssh-add -l | grep -c ".ssh/id_rsa" ) -eq 0 ]; then
    ssh-add ~/.ssh/id_rsa
  fi
fi

if [ -f ~/.ssh/id_dsa ]; then
  if [ $(ssh-add -L | grep -c ".ssh/id_dsa" ) -eq 0 ]; then
    ssh-add ~/.ssh/id_dsa
  fi
fi

# Now that we have $PATH set up and ssh keys loaded, configure zgen.

# set some history options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Share your history across all your terminal windows
setopt share_history
#setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Long running processes should return time after they complete. Specified
# in seconds.
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Expand aliases inline - see http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/orenmazor/.rbenv/shims:/Users/orenmazor/.rbenv/bin:/Users/orenmazor/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/Users/orenmazor/opt/golang/bin:/Applications/Vagrant/bin:/usr/local/go/bin"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export RAILS_ENV=development
export RACK_ENV=development

# Load AWS credentials
if [ -f ~/.aws/aws_variables ]; then
  source ~/.aws/aws_variables
fi

# JAVA setup - needed for iam-* tools
if [ -d /Library/Java/Home ];then
  export JAVA_HOME=/Library/Java/Home
fi

 # Speed up autocomplete, force prefix mapping
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/cache
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# In case a plugin adds a redundant path entry, remove duplicate entries
# from PATH
#plugins=(git)
#
# This snippet is from Mislav Marohnić <mislav.marohnic@gmail.com>'s
# dotfiles repo at https://github.com/mislav/dotfiles

dedupe_path() {
  typeset -a paths result
  paths=($path)

  while [[ ${#paths} -gt 0 ]]; do
    p="${paths[1]}"
    shift paths
    [[ -z ${paths[(r)$p]} ]] && result+="$p"
  done

  export PATH=${(j+:+)result}
}

export NVM_DIR=~/.nvm

dedupe_path
eval "$(docker-machine env dev)"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Just comment a section if you want to disable it
SPACESHIP_PROMPT_ORDER=(
  # time        # Time stampts section (Disabled)
  user          # Username section
  dir           # Current directory section
#  host          # Hostname section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
  # package     # Package version (Disabled)
#  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
  # xcode       # Xcode section (Disabled)
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
  # julia       # Julia section (Disabled)
  # docker      # Docker section (Disabled)
  aws           # Amazon Web Services section
  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
  # ember       # Ember.js section (Disabled)
#  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
  # vi_mode     # Vi-mode indicator (Disabled)
#  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
