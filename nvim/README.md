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

#### Files

This feature is a collection of plugins that primarily deal with file 
interaction that help manipulate, maintain, and interact with files on the 
host system.

- [nvim.tree](https://github.com/nvim-tree/nvim-tree.lua) is a file explorer for
neovim written in lua.
- [telescope](https://github.com/nvim-telescope/telescope.nvim) is a highly 
extendable fuzzy file finder. Telescope is a community driven builtin 
pickers, sorters and previewers for files.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) Super fast git 
decorations implemented purely in lua/teal.

#### Style

Style collects and manages all of the style related plugins that display 
system settings.

- [lualine](https://github.com/nvim-lualine/lualine.nvim) is blazing fast and 
easy to configure neovim statusline written in lua.
- [nightfly](https://github.com/bluz71/vim-nightfly-colors) is a dark midnight 
theme for modern Neovim and classic Vim.
- [devicons](https://github.com/nvim-tree/nvim-web-devicons) A lua fork of 
vim-devicons. This plugin provides the same icons as well as colors for each
icon.

#### Terminal

Terminal is split between two mechanism, the defaul `:terminal` and 
**floatem**. 

- [floaterm](https://github.com/voldikss/vim-floaterm) use (neo)vim terminal in 
the floating/popup window.

#### Autocomplete

This is a broad spectrum of plugins that includes autocomplete, snippets, lsp, 
linters, etc.

- [cmp](http://neovimcraft.com/plugin/hrsh7th/nvim-cmp/index.html) A completion 
engine plugin for neovim written in Lua. Completion sources are installed from 
external repositories and "sourced".
  - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) a nvim-cmp source for 
  buffer words.
  - [cmp-path](https://github.com/hrsh7th/cmp-path) a nvim-cmp source for 
  filesystem paths.
- [luasnip](https://github.com/L3MON4D3/LuaSnip) snippet engine for nvim 
written in lua.
  - [cmp-luasnip](ihttps://github.com/saadparwaiz1/cmp_luasnip) a luasnip 
  completion source for nvim-cmp.
  - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) 
  Snippets collection for a set of different programming languages. The only 
  goal is to have one community driven repository for all kinds of snippets in 
  all programming languages, this way you can have it all in one place. 
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is a parser 
generator tool and an incremental parsing library. It can build a concrete 
syntax tree for a source file and efficiently update the syntax tree as the 
source file is edited. 

## Notes

### NvChad

- [NvChad](https://github.com/NvChad/NvChad) This is the previous enviroment 
settings being used.  This has been deprecated in favor of attempting to 
manually setup and document the nvim environment.

### Lua Based neovim
- This mechanism uses [plenary](https://github.com/nvim-lua/plenary.nvim) 
which is a set of kinda standard functions used by other lua code being used.

- Switching away from vimscript. To a lua based configuration. This is based
on [Josean Martinez](https://github.com/josean-dev/dev-environment-files).
