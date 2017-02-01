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

#As part of brew install pyqt,opencv,etc:
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#Inorder to have pip numpy,scipy,etc override the system framework versions:
export PYTHONPATH=/Library/Python/2.7/site-packages:$PYTHONPATH

#uncomment to access anaconda python distribution
#export PATH=~/anaconda/bin:$PATH

# For homebrew installation put /usr/local/bin ahead of /usr/bin. And add /usr/local/sbin
#PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
#export PATH

# PYTHONPATH additions???
# opencv libary (cv.so) compiled against EPD6.3 is in /usr/local/lib/python2.6/site-packages and needs to be in pythonpath
# PYTHONPATH="/usr/local/lib/python2.6/site-packages:/Users/andalman/Documents/Code/ZebrafishDisplay:/Users/andalman/Documents/Code/AvoidanceLearning:"
# export PYTHONPATH

#ls alias
alias l='ls -lahGF'
alias ll='ls -lahGF'

notebooktunnel() {
    ssh $1 -L $2:127.0.0.1:$2 -N
}
alias cnb=notebooktunnel

export p10=ubuntu@ec2-54-83-92-170.compute-1.amazonaws.com
export f01234=ubuntu@ec2-54-235-26-156.compute-1.amazonaws.com
export f01238=ubuntu@ec2-54-87-224-6.compute-1.amazonaws.com
export f01239=ubuntu@ec2-54-196-186-1.compute-1.amazonaws.com
export f01240=ubuntu@ec2-54-82-255-183.compute-1.amazonaws.com

#ssh aliases (-Y allows X11 connections)
alias c3="ssh c3"
alias c4="ssh c4"
alias ch="ssh ch"
alias conchis="ssh -Y andalman@conchis.stanford.edu"
alias cs="ssh -Y aandal@cardinal.stanford.edu"


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

export PATH="/Users/andalman/Library/Application Support/GoodSync":$PATH

# added by Anaconda 2.2.0 installer
export PATH="/Users/andalman/anaconda/bin:$PATH"

# added for git ipynb cleaning see (https://gist.github.com/pbugnion/ea2797393033b54674af)
export PATH="/Users/andalman/packages/scripts:$PATH"

# AA: added as part of thunder/spark installation
#export SPARK_HOME=/Users/andalman/packages/spark-1.4.0-bin-hadoop1
#export SPARK_HOME=/Users/andalman/packages/spark-1.6.1-bin-hadoop2.4
export SPARK_HOME=/Users/andalman/packages/spark-1.6.0-bin-hadoop1
export IPYTHON=1
export AWS_ACCESS_KEY_ID=AKIAJVCL4BVX3MFPL46A
export AWS_SECRET_ACCESS_KEY=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
# AA: added because I installed thunder using git instead of pip
#export PYTHONPATH=/Users/andalman/projects/thunder:$rePYTHONPATH
#export PATH="/Users/andalman/projects/thunder/bin:$PATH"
export PATH=/root/scripts:$PATH
export PYTHONPATH=/root/LFAnalyze/code:$PYTHONPATH
