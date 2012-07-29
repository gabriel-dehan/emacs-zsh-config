# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="paper"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler rails3 ruby rvm screen)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Emacs
alias eemacs="emacs ~/.emacs.d/emacs.el"

# Wake me up in X minutes
alias wakein00="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:00:01)"
alias wakein20="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:20:00)"
alias wakein21="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:21:00)"
alias wakein22="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:22:00)"
alias wakein23="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:23:00)"
alias wakein24="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:24:00)"
alias wakein25="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:25:00)"
alias wakein30="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:30:00)"
alias wakein35="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:35:00)"
alias wakein80="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:80:00)"
alias wakein81="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:81:00)"
alias wakein82="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:82:00)"
alias wakein83="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:83:00)"
alias wakein84="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:84:00)"
alias wakein85="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:85:00)"
alias wakein90="(cd ~/Work/Ruby/pClock && ruby main.rb --sound ~/Music/amaranth_wakeup.mp3 --in 00:90:00)"

# MacPorts Installer
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

export PATH="$PATH:/Users/Diacred/Library/depot_tools"
export GTAGSLABEL=rtags
export GEMEDITOR=emacs

# Misc
alias ls='ls -G'
alias ll='ls -alh'
alias la='ls -a'
alias cp='cp -v'
alias rm='rm -v'
alias chrome='open -a "Google Chrome.app"'

# Ruby Development
alias myGems='cd ~/.rvm/rubies/ruby-1.9.2-p180/lib/ruby/gems/1.9/gems/'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# PHP Development
alias apache2='sudo /opt/local/apache2/bin/apachectl'
alias cdapache2='cd /opt/local/apache2/'
alias evhosts='sudo emacs /opt/local/apache2/conf/extra/httpd-vhosts.conf'
alias cdapache2conf='cd /opt/local/apache2/conf/'
alias ephpini='sudo emacs /opt/local/etc/php5/php.ini'
alias cdwebdir='cd ~/Work/Web'
alias ehosts='sudo emacs /etc/hosts'
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

# Javascript Development
alias meteorfork='~/Work/Meteor/meteor/meteor'
