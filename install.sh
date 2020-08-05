brew_install() {
    if command -v $1 >/dev/null 2>&1; then
        tell "Found $1: $($1 --version)"
    else
        tell "Installing $1." 
        brew install $1
    fi
}

install_mac() {

    ### Dependencies
    if command -v brew >/dev/null 2>&1; then
        tell "Found brew: $(brew --version)"
    else
        tell "Installing Homebrew." 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    brew update

    if command -v git >/dev/null 2>&1; then
        tell "Found git: $(git --version)"
    else
        tell "Installing git." 
        brew install git
    fi

    if command -v stow >/dev/null 2>&1; then
        tell "Found stow: $(stow --version)"
    else
        tell "Installing stow." 
        brew install stow
    fi

    tell "get submodules"
    git submodule init
    git pull --recurse-submodules

    tell "stowing git..."
    stow git

    ######### (N)VIM ###########
    if command -v nvim >/dev/null 2>&1; then
        tell "Found neovim: $(nvim --version)"
    else
        tell "Installing neovim." 
        brew install neovim --HEAD
    fi

    brew_install node

    tell "stowing vim..."
    stow vim
    ############################



    ######### tmux ###########
    if command -v tmux >/dev/null 2>&1; then
        tell "Found tmux: $(tmux --version)"
    else
        tell "Installing tmux." 
        brew install tmux
    fi

    tell "stowing tmux..."
    stow tmux

    
    ######### Rusty Utils ###########
    brew_install alacritty
    brew_install ripgrep
    brew_install fd
    brew_install fzf
    brew_install bat
    brew_install exa

    tell "stowing alacritty..."
    stow alacritty

    ### misc
    brew_install htop
    brew_install tree

    ### casks
    brew cask install flux

    ########################## shells #########################

    ######### Fish ###########
    if command -v fish >/dev/null 2>&1; then
        tell "Found fish: $(fish --version)"
    else
        tell "Installing fish." 
        brew install fish
    fi

    tell "stowing fish..."
    stow fish

    ######### zsh ###########
    if command -v zsh >/dev/null 2>&1; then
        tell "Found zsh: $(zsh --version)"
    else
        tell "Installing zsh." 
        brew install zsh
    fi

    tell "stowing zsh..."
    stow zsh

    tell "all done!"
    cecho "Go be great." $green
}

install_linux() {
    # TODO
    tell "install prereqs"
    sudo apt install stow
    sudo apt install fish
}

