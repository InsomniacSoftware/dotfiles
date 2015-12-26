# Check if shell is non-interactive
[[ $- != *i* ]] && return

# load global system bashrc file
[ -f /etc/bashrc ] && . /etc/bashrc

# load local system bashrc file
[ -f /usr/local/etc/bashrc ] && . /usr/local/etc/bashrc

# load my bashrc files
for rcfile in ${HOME}/.bashrc.d/*.rc ; do
  if [ -f ${HOME}/.bashtime ]; then
  {
    echo -n "Loading ${rcfile}"
    time source "${rcfile}"
    echo ""
  } else {
    source "${rcfile}"
  }
  fi;
done;

