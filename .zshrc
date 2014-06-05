export GO_ENV="development"
export PG_YN_USERNAME=orenmazor
export PG_YN_PASSWORD=

alias matrix="cd /Users/orenmazor/Projects/vagrant; vagrant up; vagrant ssh -c 'mux shopify';"
alias b="bundle"
alias be="bundle exec"
alias ber="bundle exec rake"
alias bem="bundle exec m"
alias berc="bundle exec rails console"
alias bers="bundle exec rails s"
alias bert="bundle exec rake test"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

autoload -U promptinit && promptinit
prompt pure

plugins=()

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/orenmazor/.rbenv/shims:/Users/orenmazor/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/Users/orenmazor/opt/golang/bin
export PATH=$PATH:~/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export GOPATH=/Users/orenmazor/opt/golang
export GOROOT=/usr/local/go/
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
export JRUBY_OPTS="-Xcext.enabled=true"
export RAILS_ENV=development
export RACK_ENV=development
source /opt/boxen/env.sh
fortune
