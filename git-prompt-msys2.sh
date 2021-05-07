# See:
#
# https://unix.stackexchange.com/questions/28827/why-is-my-bash-prompt-getting-bugged-when-i-browse-the-history
# https://superuser.com/questions/301353/escape-non-printing-characters-in-a-function-for-a-bash-prompt
#
# for explanation abour these crazy escape sequences. In short, to not break line editing you need to wrap
# with '\[' '\]' zero-length part of the prompt. These are in turn equivalent to \001 and \002.

git_branch_name () {
  local xroot="$PWD"
  while [ ! -e "${xroot}/.git" ]; do
    local updir=${xroot%/*}
    if [ "$updir" == "$xroot" ]; then
      break
    fi
    xroot="$updir"
  done
  local xgit_dir="$xroot/.git"
  local worktree_tag
  local fline
  if [ -f "$xgit_dir" ]; then
    # if .git is a file it can be a worktree
    read fline < .git
    xgit_dir="${fline#gitdir: }"
    worktree_tag=" (worktree)"
  fi
  if [ -f $xgit_dir/HEAD ]; then
    read fline < $xgit_dir/HEAD
    printf "[\001\e[34m\002${fline##*/}$worktree_tag\001\e[0m\002] "
  fi
}

prompt_sys () {
  printf "\001\e[35m\002$MSYSTEM\001\e[0m\002 "
}

PS1="\\[\033[01;32m\\]\u\\[\033[00m\\] \$(git_branch_name)\$(prompt_sys)\\[\e[33m\\]\w\\[\e[0m\\]$ "
