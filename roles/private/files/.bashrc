# .bashrc

###
### User specific aliases and functions
###

#stty -ixon

# path setting
if ! echo $PATH | /usr/bin/grep -q "/usr/X11/bin" ; then
	PATH="/usr/X11/bin:${PATH}"
fi

if ! echo $PATH | /usr/bin/grep -q "/usr/local/bin" ; then
	PATH="/usr/local/bin:${PATH}"
fi

if ! echo $PATH | /usr/bin/grep -q "/usr/local/sbin" ; then
	PATH="/usr/local/sbin:${PATH}"
fi

if [ -d ${HOME}/bin ]; then
	PATH="${HOME}/bin:${PATH}"
fi

export PATH MANPATH

# set LANG
#export LANG=ja_JP.eucJP
#export LC_ALL=ja_JP.eucJP
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# 'ls' color setting
export LSCOLORS="ExFxCxDxBxEGEDABAGACAD"
export TERM="xterm-color"

# set aliases
alias ls='\ls -FGv'
alias ll='\ls -lhaGv'
alias la='\ls -aGv'
alias eng='LANG=C LANGUAGE=C LC_ALL=C'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

#export http_proxy=http://192.168.2.254:8080/
#export https_proxy=$http_proxy
#export all_proxy=$http_proxy

# X display setting
#TARGET=`echo $SSH_CLIENT | awk '{print $1}'`
#if [ $TARGET ]
#then
#	export DISPLAY=$TARGET:0.0
#else
#	alias  sshX="export ORIGDISPLAY=$DISPLAY;export DISPLAY=:0;xhost +;\ssh -X"
#fi
#
#unset TARGET

# Get the user's rc file
if [ -f ~/.bashmyrc ]; then
	. ~/.bashmyrc
fi
