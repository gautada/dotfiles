# MacOS Development Environment

This is the running notes for setting up the standard development environment 
on MacOS. The goal is to remain as **VANILLA** as possible and not require
massive setup and/or configuration that would cause difficulty changing
machines.

## Configuration

- Make sure `~/.config/repo` folder exists and change to directory
- Clone the public repostitory: `git clone https://github.com/gautada/config.git public`

## ZSH

The [zsh](https://zsh.sourceforge.io) is the prefered shell

- Create symlink `~/.config/repo/public/zsh -> ~/.config/zsh`
- Create symlink `~/.config/zsh/.zshrc -> ~/.config/.zshrc`

## NeoVIM

- Get the [prebuilt releases](https://github.com/neovim/neovim/releases) of [neovim](ihttps://neovim.io) from [github](https://github.com/neovim/neovim)
- Download the tarball and extract putting the macos-nvim folder into `~/.config/apps/neovim`
- Create symlink `~/.config/scripts/nvim -> ~/.config/apps/nvim/bin/nvim`
- Make sure **PATH** includes `~/.config/scripts`
- Create symlink `~/.config/repo/public/nvim -> ~/.config/nvim`

## Podman

- Get the [prebuilt release](https://github.com/containers/podman/releases) of [podman](https://podman.io) from [GitHub](https://github.com/containers/podman)
- Install the `.pkg` file, **NOTE:** this install in `/opt/podman`
- Create symlink `/opt/podman/bin/podman -> ~/.config/scripts/podman`
- Setup the podman as a remote client

## Python

- Need to setup the default python environment.

