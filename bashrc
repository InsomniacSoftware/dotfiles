# Check if shell is non-interactive
[[ $- != *i* ]] && return

# load global system bashrc file
[ -f /etc/bashrc ] && . /etc/bashrc

# load local system bashrc file
[ -f /usr/local/etc/bashrc ] && . /usr/local/etc/bashrc

# load my bashrc files
for scr in ${HOME}/.bashrc.d/*.rc ; do test -r "${scr}" && source "${scr}"; done;

