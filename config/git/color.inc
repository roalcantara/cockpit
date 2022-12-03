# https://git-scm.com/docs/git-config#Documentation/git-config.txt-color
[color]
	ui = true
[color "branch"]
  current = magenta reverse bold
  local = magenta bold
  remote = blue bold ul
  upstream = cyan bold
  plain = white dim bold
[color "decorate"]
   branch = magenta bold
   remoteBranch = blue bold ul
   tag = red italic bold
   grafted = cyan
[color "diff"]
	commit = green bold
[color "status"]
   branch = green reverse
   added = green bold
   changed = yellow italic bold ul
   unmerged = red italic bold strike
   untracked = white italic dim
[diff]
	colormoved = dimmed-zebra
