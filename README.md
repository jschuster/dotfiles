# My .zshrc 

Feel free to get inspired by it or use the [installer](#install) to take over the whole thing.

It relys on [oh my zsh](https://ohmyz.sh)

I also use [iTerm2](https://iterm2.com) for the full 'oh my zsh'-experience :)

In my [iterm2setup](https://github.com/jschuster/iterm2setup) repo you will find a tutorial on how to set up iTerm2.

## Install
For my future me and you I wrote a Makefile installer.

So basically all you need is

* checkout this repo somehwere on your mac
* navigate into the folder and execute 
    ```
    make install
    ```

What it does:
1. install homebrew (if not already installed - you will likely use it anyway)
2. install oh-my-zsh (if not already installed - as mentioned, my setup requires it)
3. install the oh-my-zsh plugins via brew
4. backup your current .zshrc
5. create a link .zshrc to the zshrc

## License
See the [LICENSE](LICENSE) file for license rights and limitations (MIT).
