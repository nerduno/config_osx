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
brew install emacs
brew install git
brew install htop
brew install wget
brew install brew-cask
#brew install ffmpeg
#brew install netcat
#brew install redis
brew install readline
#brew install libtiff
#brew install jpeg
#brew install openblas
#brew install pkg-config
#brew install graphviz
brew install bash-completion #for scp/rsync tab completion      
#brew install valgrind
#brew install gcc
#brew install qt
#--build-from-source prevents packages that depend on python from
#  replacing the OS_X system python with brewed python.
#  (https://github.com/Homebrew/homebrew/issues/31229#issuecomment-60721969)
#It is tricky to use brew with anaconda python
#brew install sip --build-from-source
#brew install pyqt --build-from-source # AA: 2017-02-01: No longer works :(
#brew install gstreamer --build-from-source
#brew install jasper


#Note: opencv install python bindings.
#Note: see opencv formula in /usr/local/Library/Formula/ for various options.
#If issues examine cmake log: /Users/andalman/Library/Logs/Homebrew/opencv/01.cmake
#brew install opencv --with-qt --with-ffmpeg --with-gstreamer --with-jasper --without-brewed-numpy --build-from-source

#brew install hdf5
#brew install geos #required by shapely which is required by sima
#Other things to install: zsh,
#zeromq (seems to be taken care of by pip install ipython[all])

log "Installing casks"
brew install caskroom/cask/brew-cask
#brew cask install google-chrome
#brew cask install dropbox
#brew cask install evernote
#brew cask install dashlane
brew cask install xquartz
#brew cask install paragon-ntfs
#brew cask install picasa
#brew cask install boot2docker
#brew cask install teamviewer
#brew cask install launchbar
#brew cask install spotify
#brew cask install atom
#brew cask install emacs
#brew cask install r
#brew cask install java
#brew cask install fiji
#brew cask install moom
#brew cask install arduino
#brew cask install handbrake
#brew cask install vlc
#brew cask install airfoil
#brew cask install google-drive
#brew cask install remote-desktop-connection
#brew cask install zotero
#brew cask install expandrive
#brew cask install sketchup
#brew cask info omnigraffle
#brew cask install mendeley-desktop
#Adobe CS5
#Ape (dna editor)
#DaisyDisk
#Google Photos
#Matlab
#microsoft office
#prism 7
#pycharm
#slack
#skype
#ssh tunnel manager
#tunnelblick
#station

#cairo requires xquartz
#brew install cairo

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
