# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud-custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew gem github)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/Applications/MAMP/Library/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Setup env var for MAMP & drush
export DRUSH_PHP='/Applications/MAMP/bin/php/php5.3.6/bin/php'

# Hitch rubygem.
# Allows two developers to be credited when pair programming using git.
hitch() {
  command hitch "$@"
  if [[ -s "~/Documents/customizations/hitch_export_authors" ]] ; then source "~/Documents/customizations/hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
hitch

# Add shortcuts for common bash commands.
alias c=clear

# Add shortcuts for development.
alias mamp="cd ~/Documents/htdocs"

# Use a reverse SSH tunnel in order to use the rmate command on the remote server.
alias sshq2="ssh -R 52698:127.0.0.1:52698 mimlee@quilted2.gaiahost.coop"

# Add shortcuts for testing.
alias rspecd="rspec spec --color --format doc"
alias cuke="cucumber"