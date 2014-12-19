# ------------------------------------------------------------------------------
#          FILE:  pitchfork.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  George Marchin (geomysterio@gmail.com)
# ------------------------------------------------------------------------------
if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  HOSTNAME_STRING="$(hostname)"
  HOSTNAME_LENGTH="${#HOSTNAME_STRING}"
  LEFT_PADDING=""
  RIGHT_PADDING=""
  if [ "3" -lt "$HOSTNAME_LENGTH" ]
  then
    # floor(l/2) characters of padding.
    LEFT_PADDING=$(for i in $(seq $((($HOSTNAME_LENGTH/2)-1))); do echo -n '─'; done)
    # ceil(l/2) characters of padding.
    RIGHT_PADDING=$(for i in $(seq $(((($HOSTNAME_LENGTH+1)/2)-2))); do echo -n '─'; done)
  fi

  PROMPT_LINE="$LEFT_PADDING───$RIGHT_PADDING"

  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%{$fg_bold[blue]%}%(?..↩)%{$reset_color%}"

  PROMPT='%{$fg_bold[blue]%}╭%{$reset_color%}%{$fg[blue]%}$HOSTNAME_STRING%{$fg_bold[blue]%}─%{$reset_color%}%{$fg_bold[cyan]%}%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%}$(dirstack_prompt_info)$(git_prompt_info)$(git_prompt_status)$(svn_prompt_info)$(virtualenv_prompt_info)
%{$fg_bold[blue]%}╰$PROMPT_LINE%{$fg_bold[blue]%}─%{$reset_color%} '

  PRE_PREFIX="
%{$fg_bold[blue]%}├$LEFT_PADDING%{$reset_color%}%{$fg[blue]%}"
  POST_PREFIX="%{$reset_color%}%{$fg_bold[blue]%}$RIGHT_PADDING%{$fg_bold[blue]%}─%{$reset_color%} %{$fg[blue]%}"
  SUFFIX="%{$reset_color%}"

# VC prompt info.
  ZSH_THEME_GIT_PROMPT_PREFIX="$PRE_PREFIX"'git'"$POST_PREFIX"
  ZSH_THEME_GIT_PROMPT_SUFFIX="$SUFFIX"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  ZSH_THEME_SVN_PROMPT_PREFIX="$PRE_PREFIX"'svn'"$POST_PREFIX""^/"
  ZSH_THEME_SVN_PROMPT_SUFFIX="$SUFFIX"
  ZSH_THEME_SVN_PROMPT_DIRTY=""
  ZSH_THEME_SVN_PROMPT_CLEAN=""

# Langage specific prompt info.
  ZSH_THEME_VIRTUALENV_PREFIX="$PRE_PREFIX"'env'"$POST_PREFIX"
  ZSH_THEME_VIRTUALENV_SUFFIX="$SUFFIX"

# Dirstack gets its own color
  ZSH_THEME_DIRSTACK_PROMPT_PREFIX=" %{$fg[green]%}"
  ZSH_THEME_DIRSTACK_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_DIRSTACK_PROMPT_DIRTY=""
  ZSH_THEME_DIRSTACK_PROMPT_CLEAN=""

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} added"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%} modified"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} untracked"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} deleted"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%} renamed"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} unmerged"
  ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[red]%} stashed"
  ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%} ahead"
  ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%} behind"
  ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[red]%} diverged"

else
  PROMPT='❯ '
fi
