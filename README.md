# Jerome's dotfiles

1. Install [XCode](https://apps.apple.com/gb/app/xcode/id497799835).

1. Clone the repo:

    ```
    git clone git@github.com:jeromedalbert/dotfiles.git ~/.dotfiles
    ```

1. Symlink the dotfiles:

    ```
    setopt extended_glob
    for file in ~/.dotfiles/.^(git|gitmodules|.gitignore); do
      ln -sf $file ~/${file:t}
    done
    ```

1. Install [Homebrew](http://brew.sh/) and run the scripts in `~/.scripts`.
