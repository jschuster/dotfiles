# Joachim Schuster's macOS defaults

I provide here my own macOS defaults. 
This makes it possible to perform all basic settings in one go, e.g. when reinstalling the system.
Feel free to use them at your own risk. 

They are highly inspired from the following pages
* [macOS defaults list](https://macos-defaults.com) - Uncomplete list of macOS defaults commands with demos
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles) - see his [.macos](https://github.com/mathiasbynens/dotfiles/blob/main/.macos) file for further inspiration
* [Cameron Little's dotfiles](https://github.com/apexskier/dotfiles) - see his great idea for [managing changing defaults](https://github.com/apexskier/dotfiles/blob/main/macos/defaults/README.md)


# Find defaults on your own

## Search for it
First you may search the internet resp. the Blogs / Github pages see above.

Searches for e.g. `defaults write finder list view` should bring up some results and you may find something like
```
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
```
Or the macOS defaults list page https://macos-defaults.com/finder/fxpreferredviewstyle.html.

## Extract it yourself
When you dig a little deeper, you will find that the basic things are some `plist` files where the settings are stored.

So e.g. `com.apple.finder` is just a file `com.apple.finder.plist` in `~/Library/Preferences`.

For example, you can use `git diff` to find out what changes you made in the Finder GUI Preferences before and after.
The change should be your `key` and the `value` you want to change.

1. write the changes before
```
defaults read com.apple.Finder > before.txt
```

2. do the changes in Finders Preferences

3. write the changes after and compare them
```
defaults read com.apple.Finder > after.txt ; git diff before.txt after.txt
```

An open source tool to make this even more efficient is [prefsniff](https://github.com/zcutlip/prefsniff)

You may not have set up Python3 in your zsh bash path environment. Therefore, the installation may differ from the original manual.
This is how I had to proceed to install the tool:
```
git clone https://github.com/zcutlip/prefsniff prefsniff
cd prefsniff
pip3 install -r ./requirements.txt
pip3 install .
```

Afterwards you can run the tool by `~/Library/Python/3.9/bin/prefsniff` followed by the `plist` file you want to inspect.
```
~/Library/Python/3.9/bin/prefsniff ~/Library/Preferences/com.apple.finder.plist
```

Now every change you make in the Finder Preferences will print a line like this
```
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool True
```
