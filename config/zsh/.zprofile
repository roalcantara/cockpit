# ~/.zprofile
# Sourced in login shells - BEFORE `.zshrc`
# Contains commands that should be executed only in login shells
# http://zsh.sourceforge.net/Intro/intro_3.html

# Freedesktop.org Specifications
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME="$HOME/.local/share"             # Defines the base directory relative to which user-specific data files should be stored.
export XDG_CONFIG_HOME="$HOME/.config"                # Defines the base directory relative to which user-specific configuration files should be stored.
export XDG_STATE_HOME="$HOME/.local/state"            # Defines the base directory relative to which user-specific state files should be stored.
export XDG_CACHE_HOME="$HOME/.cache"                  # Defines the base directory relative to which user-specific non-essential data files should be stored.
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"  # Defines the preference-ordered set of base directories (seperated with a colon ':') to search for data files in addition to the $XDG_DATA_HOME base directory.
export XDG_CONFIG_DIRS="/etc/xdg"                     # Defines the preference-ordered set of base directories (seperated with a colon ':') to search for configuration files in addition to the $XDG_CONFIG_HOME base directory. The base directory defined by $XDG_CONFIG_HOME is considered more important than any of the base directories defined by $XDG_CONFIG_DIRS.
export PATH="$HOME/.local/bin:$PATH"                  # User-specific executable files may be stored in $HOME/.local/bin. Distributions should ensure this directory shows up in the UNIX $PATH environment variable, at an appropriate place.

# BAT: A cat(1) clone with wings
# https://github.com/sharkdp/bat#configuration-file
export BAT_CONFIG_HOME="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$BAT_CONFIG_HOME/bat.conf"
export BAT_PAGER="less -FRi"

# EXA: A modern replacement for ls
# https://the.exa.website/features/colours
export EXA_COLORS="ln=04;01;38;5;205:ex=01;38;5;10:bl=38;5;220:ga=36:gd=31:gm=33:gn=38;5;160:gr=34:gt=37:gu=35;1:gv=33:gw=1;34:gx=1;32:lc=37:sb=32:sf=37:sn=32:su=37:tr=34:tw=1;34:tx=1;35:ue=1;35:un=38;5;160:ur=1;32:uu=1;36:uw=1;34:ux=1;32"

# FZF: A command-line fuzzy finder
# https://github.com/junegunn/fzf
export FZF_COMPLETION_TRIGGER="**"
export FZF_DEFAULT_COMMAND="fd --type f --ignore-case --follow --color=always --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--inline-info --ansi --height 90% --marker='✔' --pointer='▶' --keep-right --margin=1,1 --color=dark --prompt='❯ ' --color=fg:#f8f8f2,bg:-1,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
export FZF_CTRL_T_COMMAND="fd --type f --ignore-case --follow --color=always --hidden --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}' --bind 'ctrl-e:execute(echo {+} | xargs -o '/usr/bin/vim' -)+abort' --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_CTRL_R_OPTS="--header='[y]ank [e]edit' --preview 'bat --color=always {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND="fd --type directory"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# JQ: A lightweight and flexible command-line JSON processor
# https://stedolan.github.io/jq/manual/#Advancedfeatures
export JQ_COLORS="1;30:0;37:0;37:0;37:0;32:1;37:1;37"

# n³ The unorthodox terminal file manager
# https://github.com/jarun/nnn
export NNN_HOME="$XDG_CONFIG_HOME/nnn"
export NNN_TMPFILE="$XDG_CACHE_HOME/nnn/.lastd"

# ZSH AUTOSUGGEST: Fish-like autosuggestions for zsh
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=magenta,bold"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# ZSH-SUBSTRING_SEARCH_HIGHLIGHTING: ZSH port of Fish history search (up arrow)
# https://github.com/zsh-users/zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=red,fg=white,bold"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=magenta,fg=white,bold"
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="i"
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
export HISTORY_SUBSTRING_SEARCH_FUZZY=true

# ZSH: The Z shell
# https://zsh.sourceforge.io/
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_DATA_DIR="$XDG_DATA_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPCACHE="$ZSH_CACHE_DIR/compcache"
export ZSH_COMPDUMP="$ZSH_COMPCACHE/.zcompdump"
export HISTFILE="$ZSH_CACHE_DIR/.zsh_history"

# STARSHIP: The minimal, blazing-fast, and infinitely customizable prompt for any shell!
# https://starship.rs
export STARSHIP_CONFIG_HOME="$XDG_CONFIG_HOME/starship"
export STARSHIP_CONFIG="$STARSHIP_CONFIG_HOME/starship.toml"
export STARSHIP_CACHE="$ZSH_CACHE_DIR/starship"

# SHELDON: A fast, configurable, command-line tool to manage your shell plugins.
# https://sheldon.cli.rs
export SHELDON_DATA_DIR="$ZSH_DATA_DIR/sheldon"

# ZSH_SMARTCACHE: Caches command output to improve shell startup time
# https://github.com/QuarticCat/zsh-smartcache
export ZSH_SMARTCACHE_DIR="$ZSH_CACHE_DIR/zsh-smartcache"

for dir in $ZSH_COMPCACHE $ZSH_DATA_DIR $STARSHIP_CACHE $ZSH_SMARTCACHE_DIR; do
  if [ ! -z "$dir" ]; then
    [ ! -d "$dir" ] && mkdir -p "$dir"
  fi
done
[ ! -e "$HISTFILE" ] && touch "$HISTFILE"
