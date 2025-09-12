# Neovim

This is the documentation for the plugin configuration for Neovim.
[Issues](https://github.com/gautada/dotfiles/issues?q=is%3Aissue%20state%3Aopen%20label%3Anvim)
are tracked and should be viewed for the latest information.

## Plug-in Modules

The `.lua` files are defined by modules which are grouped by **functionality**
that is provided not the technology or git repo.

### Language Server Protocol(lsp.lua)

A **Language Server** provides language-aware features like autocomplete,
go-to definition, and hover documentation.

### Formatters and Linters (code.lua)

This module provides two features **Linting** which analyzes code for errors,
stylistic issues, and potential bugs but does not modify the code; and
**Formating** which automatically reformats code to match a consistent style.

### Files Explorer(explore.lua)

Provides functionality for file management.

### Terminal(terminal.lua)

Provides pop-up terminal.

### Artificial Intelligence(ai.lua)

Provides integration configuration and plug-in between LLMs and Neovim.

### Style(stlye.lua)

This is more of a catch-all plug-in module that handles the way Neovim looks
and feels to use.

#### Greeter

Provides the initial welcome screen / greeting dialog.  This should be
customized and very opinionated.

#### Tabs

Provides tabs for buffers.

#### Status

Status bar across the bottom of the screen.

#### Editor/Buffer

Editor/buffer focused style plug-ins. Sub-functionalities but are collected
here.

##### Column Line(lukas-reineke/virt-column.nvim)

Provides a visual marker in all editor buffers that mark the **80th** column
to help visualize when lines should be broken.

#### Theme

Provides the color theme for this installation.

## Notes

### References

- [zazencode](https://github.com/zazencodes/dotfiles/blob/main/nvim/lua/plugins/lazy.lua)
