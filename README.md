# dotfiles

A collection of configuration, scripts, etc. that are needed to run my
personal environments.  This is provided for reference and should
**almost never** be used by anyoneone else for any reason, although you are
free to do so.

This repostory is ment to use stow.

## Folder specification

[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/#variables)
  
## bat

[bat](https://github.com/sharkdp/bat) is a cat(1) clone with syntax
highlighting and Git integration.

### Themes

Currently using the theme
[Catpuccino-machiato](https://github.com/catppuccin/bat.git).
To [setup](https://github.com/sharkdp/bat#adding-new-themes) update repository
and `bat.rc`

## podman

Podman is my default OCI tool.  Currently I am not sure how to resolve the
system connection setup.  `~/.config/containers/container.conf`

```/bin/zsh
podman system connection add --default cluster tcp://podman.gautier.org:2375
```

### Functions

Defined functions for podman. Alias prefix `pm` = PodMan. These functions are
designed to be run from the image development folder. Should container a
`Containerfile`.

- pmb = podman build
- pmr = podman run (detached)
- pme = podman execute
- pmi = podman images
- pmc = podman clean: remove images
- pms = podman stop

## stow

```/bin/sh
stow --verbose <PACKAGE> --target="${HOME}"
```

### Refresh

This command refreshed the entire state

```/bin/sh
stow --verbose --target="${HOME}" \
--dir="${HOME}/.local/share/dotfiles/public" -R */
```

## zsh

This is my personal zsh configuration.  While I am sure I have pulled from
other sources; I am sure I have not given credit.  I will strive to do so
from this point forward.

### rc

This is the standard `~/.zshrc` file.  This uses the drop-in pattern for
configuration. All configuraton should be in a logical `.rc` file in the
`rc.d` directory. All the `rc` file does is loop and load every file in
`rc.d/*.rc`.

### profile

This is used for login shells and sets the environment variables or
login-specific settings.

### completion

Currently auto-completion is set in the `rc.d/completion.rc`.  The
current completions are:

- kubectl

### other (rc.d/*.rc)

- aliasses: Sets keyboard/cli aliases - letter controls
- env: Environment variables mainly
  [XDG](https://specifications.freedesktop.org/basedir-spec/latest/)
- functions: Defines shell functions
- history: Setup history cache configuration
- homebrew: Configuration of [Homebrew](https://brew.sh)
- nvm: Configuration of nodejs
- path: Configures the default system path
- session: Configures the zsh session mechanism
- zsh: Specific ZSH setup that does not work in other files

## starship

[starship](https://starship.rs) is the minimal, blazing-fast, and infinitely
customizable prompt for any shell.
