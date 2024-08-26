# My own configuration of **Neovim**, **Tmux** and **Alacritty** (***dotfiles***)

This is my personal configuration of **Neovim**, **Tmux** and **Alacrity**. I already had a repository of my Neovim configuration but I don't included the other config files and It was so frustrating for me copy and paste in a USB the files; so I decided to make an a new repository with all my stuff and here we are! Organized and in their own section 

## Before you start
> [!WARNING]
> Before you use this config files, It is a good practice to do a backup for your own config in case you wanna go back to them. Once you did a backup file now you can use this dotfiles.

### Let's begin

Now you need to install `Neovim`, `Alacritty`, `Tmux` and `stow`

For Debian distros:
```
$ sudo apt install neovim alacritty tmux stow
```
For Fedora:
```
$ sudo dnf install neovim alacritty tmux stow
```
Just install it with the package manager of your distro. Once you already install all the dependencies clone the repository with `git clone` and go inside the repo:
```
$ cd dotfiles
```
After that you can use the `stow` command:
```
$ stow nvim
$ stow alacritty
$ stow tmux
```
Or if you had a existing configuration:
```
$ stow --adopt nvim
$ stow --adopt alacritty
$ stow --adopt tmux
```
> [!NOTE]
> The last commands will move your existing config files to the **dotfiles** carpet
This will make a *symbolic link* (**Symlink**). Maybe you should checkout in the `~/.config/` path, you can check it with:
```
$ ls -la ~/.config/nvim
$ ls -la ~/.config/tmux
$ ls -la ~/.config/alacritty
```
### "I don't wanna your config files, they suck! How I can go back to my previous configuration?"
If you wanna go back to your previous configuration you can use:
```
$ git restore .
```
For restoring the ***all*** configuration files. But if you only wanna restore one of them you can use:
```
$ git restore nvim
```
And you have it! You restore your last config.

## Update the configuration
If I made some changes in the files, for update the configuration you neet to do the next steps.
- Go to the repo:
```
cd ~/dotfiles
```
- `pull` the changes:
```
$ git pull
```
- Upgrade the *symbolic links*:
```
$ stow -R nvim alacritty tmux
```
Now you have the most fresh updates for the configs.

> [!IMPORTANT]
> If you made some local changes, fisrt `stash` the changes before you `pull` the repository. This will avoid conflicts with Git.

# Important Considerations
1. Install [`tpm` (*Tmux Plugin Manager*)](https://github.com/tmux-plugins/tpm).
- Once you installed the `tpm` use the command `<prefix> + I` for install all the plugins.
2. For the **Neovim** plugins go to `plugins.lua` with Neovim and set the source file in command mode with `:so` or `:source %` and then use `:PackerInstall`.
3. Like `tpm` in the first point, install the themes for [**Alacritty**](https://github.com/alacritty/alacritty-theme)
