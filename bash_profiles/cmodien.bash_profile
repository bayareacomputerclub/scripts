function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$RED\u@\h:\w$GREEN\\($(parse_git_branch)\)$BLUE]\
$GREEN\$ "
PS2='> '
PS4='+ '
}
proml
#adding maven to the path
export PATH=/Developer/buildtools/apache-maven-2.2.1/bin:$PATH
export MAVEN_OPTS=-Xmx1024m

# MacPorts Installer addition on 2009-08-29_at_10:53:46: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/Applications/ccollab_client/:~/scripts/:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# MacPorts Installer addition on 2009-08-29_at_10:53:46: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

export FLEX_HOME=/Developer/Web/Flex/SDK/2010.03.21.flex_sdk_4.0.0.14159

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

if [[ -s /Users/clint/.rvm/scripts/rvm ]] ; then source /Users/clint/.rvm/scripts/rvm ; fi
##
# Your previous /Users/clint/.bash_profile file was backed up as /Users/clint/.bash_profile.macports-saved_2010-01-18_at_15:03:23
##

# MacPorts Installer addition on 2010-01-18_at_15:03:23: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#Add flex bin folder
export PATH=/Developer/Web/Flex/SDK/2010.03.21.flex_sdk_4.0.0.14159/bin:$PATH

# Directory coloring found here:
#http://www.macosxhints.com/article.php?story=20031027145026892
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

#export GIT_DIR=/Users/lbayes/.git
#export CLOJURE_EXT=/Users/lbayes/lib

alias ls='ls -G'
alias la='ls -la'

alias gh="git stash"
alias gcp="git cherry-pick $1"
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b $1'
alias gm='git merge'
alias gs='git status'
alias gco="git commit -m $1"
alias gl="git log"
alias glast="git log --stat -n $1"
alias glpretty="git log --pretty=oneline"
alias gpom="git pull origin master"
function gbin { 
	echo branch \($1\) has these commits and \($(parse_git_branch)\) does not 
	git log ..$1 --no-merges --format='%h | Author:%an | Date:%ad | %s' --date=local
}

function gbout { 
	echo branch \($(parse_git_branch)\) has these commits and \($1\) does not 
	git log $1.. --no-merges --format='%h | Author:%an | Date:%ad | %s' --date=local
}

function gd2 { 
	echo branch \($1\) has these commits and \($2\) does not 
	git log $2..$1 --no-merges --format='%h | Author:%an | Date:%ad | %s' --date=local
}
function grin {
	git fetch origin master
	gd2 FETCH_HEAD $(parse_git_branch)
}
function grout {
	git fetch origin master
	gd2 $(parse_git_branch) FETCH_HEAD
}
function gbsearch {
	local branch=$(parse_git_branch)
	if [ ! -z $2 ]; then branch=$2; fi
	git ls-tree -r --name-only $branch | grep -i $1
}
alias fgit="say git suckz donk"

#test -r /sw/bin/init.sh && . /sw/bin/init.sh
#export PATH=/usr/local/bin:$PATH
#export MANPATH=/usr/local/man:$MANPATH

# Set up the prompt here:

#export HISTIGNORE="&:exit"
#export SVN_EDITOR="vim"
# export TERM=mach-color
# Prompt config found here:
# http://www-128.ibm.com/developerworks/linux/library/l-tip-prompt/
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

export PS1="$YELLOW\u@\h \W (\$(parse_git_branch)): $GREEN"
# export PS1="[\033[1;36m]\h[\033[33m](\w) \$[\033[0m] "
# export PS1="[\033[1;36m]\h[\033[33m](\w) \$[\033[0m] "
#export PS1="\e[1;33m\u@\h \W \$(parse_git_branch):\e[m "

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# screen -q -a