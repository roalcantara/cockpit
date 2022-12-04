# ~/.zshrc
# Sourced on all invocations of the shell - unless the -f option is set
# Contains commands and set variables that should be available to other programs
# http://zsh.sourceforge.net/Intro/intro_3.html
# https://zsh.sourceforge.io/Contrib/startup/std/zshrc

# ZSH profilling and tracing
[ -n "$z_prof" ] && zmodload zsh/zprof;
if [[ -n "$z_trace" || -n "$z_xtrace" ]]; then
  if [ -n "$z_xtrace" ]; then
    zmodload zsh/datetime
    setopt PROMPT_SUBST
    PS4='$EPOCHREALTIME#%N:%i => '
  fi
  setopt XTRACE
fi

# SETTINGS {
  setopt    AUTO_CD
  setopt    AUTO_PUSHD
  setopt    CHASE_LINKS
  setopt    CHASE_DOTS
  setopt    PUSHD_IGNORE_DUPS
  setopt    PUSHD_TO_HOME
  setopt    PUSHD_SILENT
  setopt    CD_SILENT
  setopt    BAD_PATTERN
  setopt    NOMATCH
  setopt    GLOB_DOTS
  setopt    EXTENDED_GLOB
  setopt    BRACE_CCL
  setopt    MARK_DIRS
  setopt    NUMERIC_GLOB_SORT
  setopt    NO_CASE_GLOB
  setopt    APPEND_HISTORY
  setopt    EXTENDED_HISTORY
  setopt    HIST_EXPIRE_DUPS_FIRST
  setopt    BANG_HIST
  setopt    SHARE_HISTORY
  setopt    HIST_IGNORE_DUPS
  setopt    HIST_IGNORE_SPACE
  setopt    HIST_REDUCE_BLANKS
  setopt    HIST_VERIFY
  setopt    HIST_SUBST_PATTERN
  setopt    HIST_IGNORE_ALL_DUPS
  setopt    ALIASES
  setopt    CLOBBER
  setopt    HASH_CMDS
  setopt    HASH_EXECUTABLES_ONLY
  setopt    HASH_DIRS
  setopt    PATH_DIRS
  setopt    RC_QUOTES
  unsetopt  MAIL_WARNING
  setopt    TRANSIENT_RPROMPT
  setopt    PROMPT_SUBST
  setopt    MULTIOS
  setopt    ALIAS_FUNC_DEF
  setopt    SH_FILE_EXPANSION
  setopt    BSD_ECHO
  setopt    NO_BEEP
  setopt    COMBINING_CHARS
  setopt    COMPLETE_IN_WORD
  setopt    ALWAYS_TO_END
  setopt    PATH_DIRS
  setopt    AUTO_MENU
  setopt    AUTO_LIST
  setopt    AUTO_PARAM_SLASH
  setopt    EXTENDED_GLOB
  unsetopt  CASE_GLOB
  unsetopt  MENU_COMPLETE
  unsetopt  FLOW_CONTROL

  zstyle ':chpwd:' recent-dirs-default true
  zstyle ':chpwd:' recent-dirs-file "${ZDOT[recent_dirs_file]}"
  zstyle ':chpwd:' recent-dirs-max "${ZDOT[recent_dirs_max]}"
  zstyle ':chpwd:*' recent-dirs-pushd true
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*:default' list-prompt '%S%M matches%s'
  zstyle ':completion:*' verbose yes
  zstyle ':completion:*' complete true
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*' menu yes
  zstyle ':completion:*' rehash true
  zstyle ':completion:*' file-list all
  zstyle ':completion:*' regular always
  zstyle ':completion:*' file-sort name
  zstyle ':completion:*' use-compctl false
  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' list-suffixes true
  zstyle ':completion:*' special-dirs true
  zstyle ':completion:*' squeeze-slashes true
  zstyle ':completion:*' list-dirs-first true
  zstyle ':completion:*' strip-comments true
  zstyle ':completion:*' preserve-prefix '//[^/]##/'
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  zstyle ':completion:*' completer _complete _match _approximate
  zstyle ':completion:*' use-cache yes
  zstyle ':completion:*:*:*:*:*'      menu yes
  zstyle ':completion:*:matches'      group 'yes'
  zstyle ':completion:*:options'      description 'yes'
  zstyle ':completion:*:options'      auto-description '%d'
  zstyle ':completion:*:functions'    ignored-patterns '(_*|pre(cmd|exec))'
  zstyle ':completion:*:messages'     format '%B%F{purple} -- %d --%f%b'
  zstyle ':completion:*:warnings'     format '%B%F{red}no matches found...%f%b'
  zstyle ':completion:*:corrections'  format '%B%F{green} -- %d --%f%F{magenta}(errors: %e)%f%b'
  zstyle ':completion:*:descriptions' format '[%d]'
  zstyle ':completion:*:match:*' original only
  zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
  zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
  zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
  zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
  zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
  zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
  zstyle ':completion:*:history-words' stop yes
  zstyle ':completion:*:history-words' remove-all-dups yes
  zstyle ':completion:*:history-words' list false
  zstyle ':completion:*:history-words' menu yes
  zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
  zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
  zstyle ':completion:*:rm:*' file-patterns '*:all-files'
  zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
  zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
  zstyle ':completion:*:*:kill:*' menu yes select
  zstyle ':completion:*:*:kill:*' force-list always
  zstyle ':completion:*:*:kill:*' insert-ids single
  zstyle ':completion:*:manuals' separate-sections true
  zstyle ':completion:*:manuals.(^1*)' insert-sections true
  zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
  zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
  zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
  zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'
  zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
  zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
  zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
  zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
  zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
  zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
  zstyle ':completion:*:*:docker:*' option-stacking yes
  zstyle ':completion:*:*:docker-*:*' option-stacking yes

  typeset -gaU path fpath cdpath manpath
  path=(${path[@]})
  fpath=(${fpath[@]})
  cdpath=(${cdpath[@]})
  manpath=(${manpath[@]})
# }

# ALIASES {
  # UTILITIES {
    # http://zsh.sourceforge.net/Intro/intro_8.html
    # suffix: allows to open specific programs for files
    # that are typed into the command line depending on their extensions
    # e.g.: ❯ file.pdf # open file.pdf on PDF viewer in background
    alias -s {pdf,PDF}='background mupdf'
    alias -s {htm,html,HTM,HTML}='background brave'
    alias -s {mp4,MP4,mov,MOV}='background vlc'
    alias -s {zip,ZIP}='unzip -l'
    alias -s {tar,TAR}='tar -xvf'

    # Grep history
    alias hgrep='fc -Dlim "*$@*" 1'
  # }

  # GIT {
    # A distributed version control system
    # https://git-scm.com/
    alias -g g=git

    # STATUS
    alias gst='g status'
    alias gsts='g status --short'

    # BRANCH
    alias gb='g branch'
    alias gbs='g show-branch'
    alias gbv='g branch -vv'
    alias gbva='g branches'
    alias gbd='g branch --delete'
    alias gbd!='g branch --delete --force'
    alias gbx='g fzbd'  # (fuzzy) git branch -d [<branch>]
    alias gbx!='g fzbx' # (fuzzy) git branch -D [<branch>]

    # PULL
    alias gfr='g pull --rebase'
    alias gfra='g pull --rebase --autostash'

    # CHECKOUT
    alias gco='g fzc' # (fuzzy) git checkout --guess [<pathspec>…​]
    alias gcob='g checkout -b'
    alias gcom='g checkout $(git main-branch)'
    alias gco!='g fetch --all && git remote prune origin && git fzc'
    alias gcom!='g fetch --all && git remote prune origin && git checkout $(git main-branch)'

    # LOG
    alias gl='g l'
    alias glo='g fzl | pbcopy' # (fuzzy) git log | pbcopy
    alias glol='g lol' # git log long

    # ADD
    ga() {
      [ -n "$1" ] && g add "$@" || git fza # (fuzzy) git add --force [<pathspec>…​]
    }
    alias gaa='g add .'
    alias gs='g stash'

    # RESTORE
    alias grs='g fzu' # (fuzzy) git restore [<pathspec>…​]
    alias grS='g fzus' # (fuzzy) git restore --staged [<pathspec>…​]
    alias grs!='g restore .'
    alias grS!='g restore --staged .'
    grm() {
      [ -n "$1" ] && git rm -r --cached "$1" || git fzunstage # (fuzzy) git rm --cached <file>
    }

    # COMMIT
    alias gc='g commit --verbose'
    alias gca='g commit --verbose --amend'
    alias gca!='g commit --verbose --amend --no-verify'
    alias gCa!='g commit --verbose --amend --no-verify --no-edit'
    alias gcw='g wip'
    alias gct='g tmp'

    # RESET
    alias grh='g fzhs' # (fuzzy) git reset --soft [<pathspec>…​]
    alias grH='g fzhh' # (fuzzy) git reset --hard [<pathspec>…​]
    alias grH!='g update-ref -d HEAD'

    # REBASE
    alias gr='g fzr'    # (fuzzy) git rebase -i <commit>^
    alias grw='g fzw'   # (fuzzy) git reword <commit>
    alias ge='g fze'    # (fuzzy) git edit <commit>
    alias gd='g fzdiff' # (fuzzy) git diff [<commit>] [--] [<path>...]
    alias gx='g fzd'    # (fuzzy) git drop <commit>
    alias gfz='g fzf'   # (fuzzy) git fix <commit>
    alias grcc='g rebase --continue'
    alias grsk='g rebase --skip'
    alias gra='g rebase --abort'
    alias gr!='g rebase -i --root'

    # CHERRY-PICK
    alias gcp='g cherry-pick --ff'
    alias gcpc='g cherry-pick --continue'
    alias gcpa='g cherry-pick --abort'

    # PUSH
    alias gp='g push -v'
    alias gp!='g push -v --force'
    alias gpu='g push -v --set-upstream origin "$(git current-branch)"'
    alias gpT='g push --tags'

    # REMOTE
    alias gR='g remote'
    alias gRa='g remote add'

    # TAGS
    alias gtg='g tag --format "%(color:green bold)%(objectname:short)%09%(color:yellow bold)(%(refname:short))%(color:reset) %(color:white bold)%(contents:subject) %(color:reset)%(color:cyan)(%(authordate:format:%h/%d)) %(color:blue)%(authorname)" --sort -version:refname'

    # Copy co-authors' names to clipboard
    # https://blog.testdouble.com/posts/2020-04-07-favorite-things/
    alias gcauth='g Co-authored-by: %s" "$(git log --pretty=format:"%an <%ae>" -1000 | sort | uniq | fzf)" | pbcopy'
  # }

  # EXA {
    # A modern replacement for ls
    # https://the.exa.website/features/colours
    alias ls='exa --color=always --classify --group-directories-first'                            # List non-hidden folders and files inline
    alias l='ls --oneline'                                                                        # List non-hidden folders and files in columns
    alias ll='ls --binary --icons --long --header --modified --created --group --time-style=iso'  # List non-hidden folders and files in columns (human readable)
    alias lt='ls --tree --level=2'                                                                # tree
    alias la='ll -a --git'                                                                        # List all files in columns
    alias lam='la --sort=modified'                                                                # List all files, sorted by modified date
    alias lac='la --sort=created'                                                                 # List all files, sorted by created date
    alias lal='lal -Sa@ --color-scale'                                                            # List all files in columns (extended)

    alias llr='ll -R'                                                                             # Lists human readable sizes, recursively.
    alias lap='la | "$PAGER"'                                                                     # Lists human readable sizes, hidden files through pager.
    alias lax='lla --sort=Extension'                                                              # Lists sorted by extension (GNU only).
    alias lls='lla --sort=size -r'                                                                # Lists sorted by size, largest last.
    alias ltm='la --sort=modified -r'                                                             # Lists sorted by date, most recent last.
    alias llc='ltm -m'                                                                            # Lists sorted by date, most recent last, shows change time.
    alias llv='ltm -u'                                                                            # Lists sorted by date, most recent last, shows access time.
  # }

  # VI {
      alias vim='vi'
      alias view='vi -R'
      alias vimgrep='vi -c "vimgrep"'
      alias vimdiff='vi -d'
  # }
# }

# PLUGINS {
  # FZF-TAB {
    # https://github.com/Aloxaf/fzf-tab/wiki/Configuration
    zstyle ':completion:complete:*:options' sort false
    zstyle ':fzf-tab:*' fzf-command fzf
    zstyle ':fzf-tab:*' show-group full
    zstyle ':fzf-tab:*' switch-group ',' '.'
    zstyle ':fzf-tab:*' continuous-trigger '/'
    zstyle ':fzf-tab:*' query-string prefix input first
    zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
    zstyle ':fzf-tab:*' accept-line enter
    zstyle ':fzf-tab:*:' prefix '·'                                                                                                                    # If not set zstyle ':completion:*:descriptions' format, it will be set to empty
    zstyle ':fzf-tab:*:' fzf-pad 4                                                                                                                     # How many lines does fzf's prompt occupied
    zstyle ':fzf-tab:complete:cd:*' tag-order local-directories named-directories                                                                      # preview directory's content with exa when completing cd
    zstyle ':fzf-tab:complete:(cd|ls):*' fzf-preview 'exa -1 --color=always --icons --git --classify --sort=.name --group-directories-first $realpath' # remember to use single quote here!!!
    zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'command -v $word 2>/dev/null || eval echo \$$word'
    zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-flags --tac --no-sort --height=30% --preview-window down,30%,wrap
    zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
    zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
    zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
    zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
      'case "$group" in
      "commit tag") git show --color=always $word ;;
      *) git show --color=always $word | delta ;;
      esac'
    zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
      'case "$group" in
      "modified file") git diff $word | delta ;;
      "recent commit object name") git show --color=always $word | delta ;;
      *) git log --color=always $word ;;
      esac'
    zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
    zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
    zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
  # }

  # KEYBINDINGS {
    #     ____      ____
    #    / __/___  / __/
    #   / /_/_  / / /_
    #  / __/ / /_/ __/
    # /_/   /___/_/ key-bindings.zsh
    #
    # - $FZF_TMUX_OPTS
    # - $FZF_CTRL_T_COMMAND
    # - $FZF_CTRL_T_OPTS
    # - $FZF_CTRL_R_OPTS
    # - $FZF_ALT_C_COMMAND
    # - $FZF_ALT_C_OPTS

    # Key bindings
    # ------------

    # The code at the top and the bottom of this file is the same as in completion.zsh.
    # Refer to that file for explanation.
    if 'zmodload' 'zsh/parameter' 2>'/dev/null' && (( ${+options} )); then
      __fzf_key_bindings_options="options=(${(j: :)${(kv)options[@]}})"
    else
      () {
        __fzf_key_bindings_options="setopt"
        'local' '__fzf_opt'
        for __fzf_opt in "${(@)${(@f)$(set -o)}%% *}"; do
          if [[ -o "$__fzf_opt" ]]; then
            __fzf_key_bindings_options+=" -o $__fzf_opt"
          else
            __fzf_key_bindings_options+=" +o $__fzf_opt"
          fi
        done
      }
    fi

    'emulate' 'zsh' '-o' 'no_aliases'

    {

    [[ -o interactive ]] || return 0

    # CTRL-T - Paste the selected file path(s) into the command line
    __fsel() {
      local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | cut -b3-"}"
      setopt localoptions pipefail no_aliases 2> /dev/null
      local item
      eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_T_OPTS-}" $(__fzfcmd) -m "$@" | while read item; do
        echo -n "${(q)item} "
      done
      local ret=$?
      echo
      return $ret
    }

    __fzfcmd() {
      [ -n "${TMUX_PANE-}" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "${FZF_TMUX_OPTS-}" ]; } &&
        echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
    }

    fzf-file-widget() {
      LBUFFER="${LBUFFER}$(__fsel)"
      local ret=$?
      zle reset-prompt
      return $ret
    }
    zle     -N            fzf-file-widget
    bindkey -M emacs '^T' fzf-file-widget
    bindkey -M vicmd '^T' fzf-file-widget
    bindkey -M viins '^T' fzf-file-widget

    # ALT-C - cd into the selected directory
    fzf-cd-widget() {
      local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type d -print 2> /dev/null | cut -b3-"}"
      setopt localoptions pipefail no_aliases 2> /dev/null
      local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-}" $(__fzfcmd) +m)"
      if [[ -z "$dir" ]]; then
        zle redisplay
        return 0
      fi
      zle push-line # Clear buffer. Auto-restored on next prompt.
      BUFFER="builtin cd -- ${(q)dir}"
      zle accept-line
      local ret=$?
      unset dir # ensure this doesn't end up appearing in prompt expansion
      zle reset-prompt
      return $ret
    }
    zle     -N             fzf-cd-widget
    bindkey -M emacs '\ec' fzf-cd-widget
    bindkey -M vicmd '\ec' fzf-cd-widget
    bindkey -M viins '\ec' fzf-cd-widget

    # CTRL-R - Paste the selected command from history into the command line
    fzf-history-widget() {
      local selected num
      setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
      selected=( $(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} ${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
      local ret=$?
      if [ -n "$selected" ]; then
        num=$selected[1]
        if [ -n "$num" ]; then
          zle vi-fetch-history -n $num
        fi
      fi
      zle reset-prompt
      return $ret
    }
    zle     -N            fzf-history-widget
    bindkey -M emacs '^R' fzf-history-widget
    bindkey -M vicmd '^R' fzf-history-widget
    bindkey -M viins '^R' fzf-history-widget

    } always {
      eval $__fzf_key_bindings_options
      'unset' '__fzf_key_bindings_options'
    }

    # While for normal editing a single keymap is used exclusively,
    # in many modes a local keymap allows for some keys to be customised.
    # For example, in an incremental search mode, a binding in the isearch keymap
    # will override a binding in the main keymap but all keys that are not overridden
    # can still be used.
    # http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Local-Keymaps
    scroll-and-clear-screen() {
      printf '\n%.0s' {1..$LINES}
      zle clear-screen
    }
    zle -N scroll-and-clear-screen
    bindkey '^l' scroll-and-clear-screen

    # [shift+left] skipping-word-backward
    bindkey '^[[1;2D' backward-word
    # [shift+right] skipping-word-forward
    bindkey '^[[1;2C' forward-word

    # https://github.com/zsh-users/zsh-history-substring-search
    # ZSH port of Fish history search (up arrow)
    bindkey "^[[A" history-substring-search-up
    bindkey "^[[B" history-substring-search-down
    zle -N history-substring-search-up; zle -N history-substring-search-down
  # }

  # ZSH_AUTOSUGGEST {
    # https://github.com/zsh-users/zsh-autosuggestions
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history history-substring-search-up})
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+="(history-substring-search-down)"
  # }
# }

eval "$(sheldon source)"

[ -n "$z_prof" ] && zprof;
if [[ -n "$z_trace" || -n "$z_xtrace" ]]; then
  unsetopt XTRACE
fi
