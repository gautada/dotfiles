# neovim

This is the documentation for the [neovim](https://neovim.io) or nvim text editing environment.

**nvim** is a refactor, and sometimes redactor, in the tradition of Vim (which itself derives from Stevie). It is not a rewrite but a continuation and extension of Vim. Many clones and derivatives exist, some very clever—but none are Vim. Neovim is built for users who want the good parts of Vim, and more.

## Features

### Plugin Manager

[vim-plug](https://github.com/junegunn/vim-plug) is a minimalist Vim plugin 
manager.

- Install: 
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- Notes:
  - The plugins are loaded in the `call plug#begin...#end` block in the 
  `~/.config/nvim/init.vim` file.
  - `:Plug...` is the command to invoke the plug-in manager.
  - `:PlugInstall` installs all the configured plugins.

### Integrated Development Environment

This is a collection of plugins and settings that configure the environment 
across all devices and environments

#### File Tree

The [NERDTree](https://github.com/preservim/nerdtree) is a file system 
explorer for the Vim editor. Using this plugin, users can visually browse 
complex directory hierarchies, quickly open files for reading or editing, and 
perform basic file system operations.


#### Status Bar

[airline](https://github.com/vim-airline/vim-airline) lean & mean 
status/tabline for vim that's light as air.

#### Terminal

[vim-terminal](https://github.com/tc50cal/vim-terminal) is a Vim plugin which 
allows you to run interactive programs, such as bash on Linux or 
powershell.exe on Windows, inside a Vim buffer. In other words, it is a 
terminal emulator which uses a Vim buffer to display the program output.

- Notes:
  - Requirement: the python package must be installed `pip install neovim`

## Notes

### NvChad

[NvChad](https://github.com/NvChad/NvChad) This is the previous enviroment 
settings being used.  This has been deprecated in favor of attempting to 
manually setup and document the nvim environment.


