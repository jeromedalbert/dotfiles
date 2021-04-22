# Jerome's dotfiles

1. Install [XCode](https://apps.apple.com/gb/app/xcode/id497799835).

2. Launch Zsh:

        zsh

3. Clone the repo:

        git clone git@github.com:jeromedalbert/dotfiles.git ~/.dotfiles

4. Symlink the dotfiles:

        setopt extended_glob
        for file in ~/.dotfiles/.^(git|gitmodules|.gitignore); do
          ln -sf $file ~/${file:t}
        done

5. Set Zsh as the default shell:

        chsh -s /bin/zsh

6. Install [Homebrew](http://brew.sh/) and run the scripts in `~/.scripts`.
