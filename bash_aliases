# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ll='ls -lF'
alias la='ls -alF'
alias ls='ls -F'

# Add shortcuts for common bash commands.
alias c=clear
alias l=less

# Add shortcuts for development.
alias mamp="cd ~/Documents/htdocs"

# Use a reverse SSH tunnel in order to use the rmate command on the remote server.
alias sshq2="ssh -R 52698:127.0.0.1:52698 mimlee@quilted2.gaiahost.coop"

# Add shortcuts for testing.
alias rspecd="rspec spec --color --format doc"
alias cuke="cucumber"