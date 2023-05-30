# neovim

This is the documentation for the [neovim](https://neovim.io) or nvim text 
editing environment.

**nvim** is a refactor, and sometimes redactor, in the tradition of Vim (which 
itself derives from Stevie). It is not a rewrite but a continuation and 
extension of vim. Many clones and derivatives exist, some very clever—but none 
are vim. Neovim is built for users who want the good parts of vim, and more.

This current implementation is based on 
[Josean Martinez's](https://github.com/josean-dev/dev-environment-files) work
for how to [setup neovim](https://www.youtube.com/watch?v=vdn_pKJUda8&t=1412s).

## Features

### Plugin Manager

[packer](https://github.com/wbthomason/packer.nvim) `use-package` inspired 
plugin/package management for neovim.

- This is installed via the `~/.config/nvim/lua/gautada/plugins-setup.lua`.
- Any changes to the plugins-setup.lua triggers the reload.

### Integrated Development Environment

This is a collection of plugins and settings that configure the environment 
across all devices and environments

#### File Explorer

[nvim.tree](https://github.com/nvim-tree/nvim-tree.lua) is a file explorer for
neovim written in lua.

#### Status Bar

[lualine](https://github.com/nvim-lualine/lualine.nvim) is blazing fast and 
easy to configure neovim statusline written in lua.

#### Terminal

Terminal is split between two mechanism, the defaul `:terminal` and 
**floatem**. 

[floaterm](https://github.com/voldikss/vim-floaterm) use (neo)vim terminal in 
the floating/popup window.

## Notes

### NvChad

- [NvChad](https://github.com/NvChad/NvChad) This is the previous enviroment 
settings being used.  This has been deprecated in favor of attempting to 
manually setup and document the nvim environment.

- Switching away from vimscript. To a lua based configuration. This is based
on [Josean Martinez](https://github.com/josean-dev/dev-environment-files).
