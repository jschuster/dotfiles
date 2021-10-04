# My .zshrc 

To share it across multiple Macs, backup and quick setup.

You may find some ideas useful, so feel free to copy parts or all of it.

With the [installer](#install) you can integrate the setup on your own Mac. 
Perhaps it's best to fork the repo and use it as the basis for your personal zshrc setup ;)

Its basically created by [oh my zsh](https://ohmyz.sh) and extended by a some more settings.

I also use [iTerm2](https://iterm2.com) for the full 'oh my zsh'-experience :)

In my [iterm2setup](https://github.com/jschuster/iterm2setup) repo you will find a tutorial on how to set up iTerm2.

## Install
For my future me and you I wrote a Makefile installer.

So basically all you need is

* checkout this repo somehwere on your Mac (as mentioned, you can fork it beforehand so you can have a custom zshrc)
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
