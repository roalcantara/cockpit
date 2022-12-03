[core]
  pager = delta --dark
[delta]
  navigate = true  # use n and N to move between diff sections
  features = dark line-numbers decorations
  side-by-side = true
  syntax-theme = Dracula
  diff-so-fancy = true
  zero-style = dim syntax
[delta "decorations"]
  commit-decoration-style = bold yellow
  file-style = bold yellow
  file-decoration-style = ul ol bold yellow
  hunk-header-decoration-style = magenta
  hunk-header-style = bold magenta reverse
[delta "line-numbers"]
  line-numbers-minus-style = red bold
  line-numbers-plus-style = green
