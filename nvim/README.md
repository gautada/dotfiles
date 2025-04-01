# Neovim

This is the documentation for the lua configuration for NeoVIM

- [Issues](https://github.com/gautada/dotfiles/issues?q=is%3Aissue%20state%3Aopen%20label%3Anvim)

## Plug-in Modules

The Neovim configuration is organized into logical plug-in modules.  This 
organiztion provides a generalized (higher-level) structure.  Therefore, a
module is named for the **functionality** that is provided not the technology.

### Language Server Protocol(lsp.lua)

A **Language Server** provides language-aware features like autocomplete,
go-to definition, and hover documentation.

### Formatters and Linters (code.lua)

This module provides two features **Linting** which analyzes code for errors,
stylistic issues, and potential bugs but does not modify the code; and 
**Formating** which automatically reformats code to match a consistent style.

### Explorer(explorer.lua)

### Terminal(terminal.lua)

### Style(stlye.lua)

This is more of a catch-all plug-in module that handles the way Neovim looks
and feels to use.

#### Welocome

#### Tabs

#### Status

#### Editor

This is a further catch-all for editor focused style plug-ins.

##### Column Line(lukas-reineke/virt-column.nvim)

Provides a visual marker in all editor buffers that mark the **80th** column
to help visualize when lines should be broken.

#### Theme
