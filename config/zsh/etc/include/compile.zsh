if [ -n "$ZSH_COMPDUMP" ]; then
  autoload -Uz zsh/complist compinit && compinit -C -u -i -d "$ZSH_COMPDUMP"
fi
