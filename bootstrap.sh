#!/bin/zsh

cd "${HOME}/.local/share/dotfiles/public" || exit 1
stow --dir="${HOME}/.local/share/dotfiles/public" --no-folding \
     --target="${HOME}" --verbose --restow */

PRIVATE_DIR="${HOME}/.local/share/dotfiles/private"
if [ -d "${PRIVATE_DIR}" ] ; then 
 cd "${PRIVATE_DIR}" || exit 2
 stow --dir="${PRIVATE_DIR}" --no-folding \
      --target="${HOME}" --verbose --restow */
fi
