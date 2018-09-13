if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#AA: Increase terminal command histoy.
HISTFILESIZE=1000000000 HISTSIZE=1000000

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

#AA: make up-arrow search command history...
#note ^[[A ^[[B cannot be copy and pasted, they represent up and down arrow.
#http://www.macworld.com/article/1146015/termhistory.html
bind '"[A":history-search-backward'
bind '"[B":history-search-forward'

# PYTHONPATH additions???
# opencv libary (cv.so) compiled against EPD6.3 is in /usr/local/lib/python2.6/site-packages and needs to be in pythonpath
# PYTHONPATH="/usr/local/lib/python2.6/site-packages:/Users/andalman/Documents/Code/ZebrafishDisplay:/Users/andalman/Documents/Code/AvoidanceLearning:"
# export PYTHONPATH

#ls alias
alias l='ls -lahGF'
alias ll='ls -lahGF'

#make emacs point to emacs.app (for GUI interface), and create file if it doesn't exist
function emacs_gui
{
    # Create the files as needed -- not as good as raw emacs, but acceptable
    for f in "$@"
    do
	test -e $f || touch $f
    done
    open -a /opt/homebrew-cask/Caskroom/emacs/24.4/Emacs.app "$@"
}

# added by Anaconda 2.2.0 installer
export PATH="/Users/andalman/anaconda/bin:$PATH"

# added for git ipynb cleaning see (https://gist.github.com/pbugnion/ea2797393033b54674af)
export PATH="/Users/andalman/packages/scripts:$PATH"
