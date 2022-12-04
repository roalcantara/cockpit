#!/usr/bin/env zsh
# shellcheck shell=bash disable=SC2154,SC1073,SC1058,SC1072,SC1009,SC1036

#? dots 0.1.0
#? License RIT (Robot Institute of Technology)
#? This is free software: you are free to change and redistribute it.
#? There is NO WARRANTY, to the extent permitted by law.

##? Manage dotfiles
##?
##? Usage:
##?      dots prof [--avg | --once]
##?      dots trace [--dbug | --once]
##?
##? Options:
##?     --avg               Show the average
##?     --dbug              Shows cdpath.
##?     --once              Shows cdpath.
##?
##? Examples:
##?     dots prof
##?     dots trace
##?     dots prof --once
##?     dots trace --dbug

dots() {
  case $1 in
    prof)
      # https://medium.com/tarkalabs/optimize-zsh-fce424fcfd5
      case $2 in
        --once) echo -e "$(z_prof=3 dots prof --avg 2>&1 >/dev/null)" ;;
        --avg) for _ in $(seq 1 "${3:-10}"); do /usr/bin/time "$SHELL" -ilc exit; done ;;
        *) z_prof=1 "$SHELL" -ilc exit ;;
      esac ;;
    trace)
      # http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fzprof-Module
      case $2 in
        --once) echo -e "$(z_prof=1 z_trace=1 dots trace 2>&1 >/dev/null)" ;;
        --dbug) z_prof=1 z_trace=1 z_xtrace=1 "$SHELL" -ilc exit ;;
        *) z_prof=1 z_trace=1 "$SHELL" -ilc exit ;;
      esac ;;
    env)
      env | sort | bat -l ini --theme Dracula;;
  esac
}
