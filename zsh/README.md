# zsh
This is my personal zsh configuration.  While I am sure I have pulled from
other sources; I am sure I have not given credit.  I will strive to do so
from this point forward.

## rc
This is the standard `~/.zshrc` file.  This uses the drop-in pattern for
configuration. All configuraton should be in a logical `.rc` file in the
`rc.d` directory. All the `rc` file does is loop and load every file in
`rc.d/*.rc`.

## profile
This is used for login shells and sets the environment variables or
login-specific settings.

## completion
Currently auto-completion is set in the `rc.d/completion.rc`.  The
current completions are:
- kubectl

## other (rc.d/*.rc)
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