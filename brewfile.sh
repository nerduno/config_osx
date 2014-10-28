 #!/usr/bin/env bash

function log() {
  echo $* > /dev/stderr
}

###################

log "brew update"
brew update

log "brew upgrade"
brew upgrade

log "Tapping.."
brew tap caskroom/fonts
brew tap caskroom/cask
brew tap homebrew/science

log "Installing brews"
brew install mosh
brew install emacs
brew install git
brew install htop
brew install wget
brew isntall brew-cask
brew install ffmpeg
brew install netcat
brew install redis
brew install readline
brew install libtiff
brew install jpeg
brew install cairo
brew install openblas
brew install valgrind
brew install gcc
brew install qt
#--build-from-source prevents packages that depend on python from
#  replacing the OS_X system python with brewed python.
#  (https://github.com/Homebrew/homebrew/issues/31229#issuecomment-60721969)
brew install sip --build-from-source
brew install pyqt --build-from-source
brew install gstreamer --build-from-source
brew install jasper
#Note: opencv install python bindings.
brew install opencv --with-qt --with-ffmpeg --with-gstreamer --with-jasper
brew install hdf5
#Other things to install: zsh,
#zeromq (seems to be taken care of by pip install ipython[all])

log "Installing casks"
#installed outside of brew: google-chrome dropbox evernote
brew cask install xquartz
brew cask install paragon-ntfs
brew cask install picasa
brew cask install boot2docker
brew cask install launchbar
brew cask install spotify
brew cask install atom
brew cask install r
brew cask install java
brew cask install fiji
#brew cask install mendeley-desktop
#brew cask install zotero

#casks to add:
#iterm2 textexplander sourcetree adium alfred
#bonjour-browser caffeine charles coconutbattery flux
#nvalt picturelife skype slack the-unarchiver vagrant
#viscosity font-inconsolata

log "brew cleanup"
brew cleanup

log "brew linkapps"
brew linkapps

echo "IMPORTANT: "
echo "    Brewed python packages must be part of python path."
echo "    Brew installs packages in /usr/local/lib/python2.7/site-packages"
echo "    To make this accessible (at least to system python) run:"
echo "        mkdir -p ~/Library/Python/2.7/lib/python/site-packages"
echo "        echo '/usr/local/lib/python2.7/site-packages' > ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth"
