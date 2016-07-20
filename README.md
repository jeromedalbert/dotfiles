# Jerome's dotfiles

  0. Install [XCode](https://itunes.apple.com/gb/app/xcode/id497799835).

  0. Launch Zsh:

        zsh

  0. Clone the repo:

        git clone git@github.com:jeromedalbert/dotfiles.git ~/.dotfiles

  0. Symlink the dotfiles:

        setopt EXTENDED_GLOB
        for file in ~/.dotfiles/.^(git|gitmodules|.gitignore); do
          ln -sf $file ~/${file:t}
        done
        for file in ~/.dotfiles/.zprezto/runcoms/^(README.md); do
          ln -sf $file ~/.${file:t}
        done

  0. Set Zsh as the default shell:

        chsh -s /bin/zsh

  0. Install [Homebrew](http://brew.sh/) and run the scripts in `~/.scripts`.
