#!/bin/bash

cd "${HOME}/.local/share/dotfiles/public"
stow --dir="${HOME}/.local/share/dotfiles/public" --no-folding --target="${HOME}" --verbose --restow */
