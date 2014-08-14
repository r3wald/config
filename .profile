PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;33m\]\w\[\033[00m\]\$ '

# enable color support of ls and also add handy aliases
alias ls='ls -G'

alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'
alias l='ls -lA'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/local/share/liquidprompt ]; then
	. /usr/local/share/liquidprompt
fi

export HOMEBREW_GITHUB_API_TOKEN=9129e5950a070f0b9f29e124bac1d4c70a25f70c
