#!/bin/bash
#
# This installer will create links to the bash dotfiles from your home directory
# It will move/rename any existing files first
#
# The installer should only be run with the dotfiles dir is your current working dir
#
if ! test -e "./bashrc" -a -e "./install.sh"; then
  echo "Only run install.sh from within the dotfiles directory"
  exit 1
fi

DOTDIR="$PWD"
pushd ${HOME} >/dev/null


for x in \
  bash_completion \
  bash_completion.d \
  bash_profile \
  bashrc \
  bashrc.d \
  gitattributes \
  inputrc \
; do
  test -e ".${x}" && mv ".${x}" ".${x}.bak"
  ln -s "${DOTDIR}/${x}" ".${x}"
done

test -e ".config/git/ignore" || {
  mkdir -p .config/git/ 2>/dev/null
  cp "${DOTDIR}/gitignore" .config/git/ignore
}

