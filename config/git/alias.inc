# https://git-scm.com/docs/git-config#Documentation/git-config.txt-alias

[alias]
# a)dd
a=add
aa=add --all

# c)ommits
c=commit
cm=commit --message
cn=commit --no-verify
ca=commit --amend
can=commit --amend --no-verify
cmn=commit --message --no-verify
car=commit --amend --reuse-message HEAD
caa=commit --all
caan=commit --all --no-verify
caam=commit --all --message
tmp=!git commit --all --no-verify --message 'fix: '${1:-Temp}
wip=!git commit --all --no-verify --message 'fix: '${1:-Wip}
rh=!git reset --soft ${1:-HEAD}
rhr=!git reset --hard ${1:-HEAD}
# discard changes (all by default) -> git discard (/path/to/file)
discard=!git restore ${1:-.}
# restore staged files (all by default) -> git restore (/path/to/file)
unstage=!git restore --staged ${1:-.}
# undo commits keeping the changes (last commit by default) -> git undo (4aa879fs)
undo=!git reset ${1:-HEAD}^
# undo from the root commit keeping the changes -> git undo-from-root
undo-from-root=update-ref -d HEAD

# st)atus
st=status --short
sts=status
stv=status --short --branch
clash=!git st | grep '^[UMDA]\\{2\\} ' | awk '{ print $2 }'
staged=!git st | grep '^[M|A|D]'
unstaged=!git st | grep '^ [M|A|D]'
untracked=!git st | grep '^?'
changes=!git st | grep -E '\\?| M|MM|DM| D'

# l)gs
l=log --color=always
lo=log --color=always --all --max-count=100
lolg=log --color=always --all --graph
last=log -1 HEAD --stat
tree=log --graph --oneline --all
last-commit=log -1 HEAD --pretty='%h'

# b)ranches
b=branch --verbose --verbose --color=always
bv=branch --verbose --verbose --color=always --list
ba=branch --verbose --verbose --color=always --all --list
bd=branch --delete
bs=show-branch
merged=branch --no-color --merged
branches=!git ba | grep -v 'HEAD'
current-branch=rev-parse --abbrev-ref HEAD
main-branch=config init.defaultBranch
merged-clear=!git merged | grep -v '\\*\\|main\\|master\\|develop' | xargs git branch -D
remote-branches=!git branch -a | grep remotes/${1:-origin}/ | cut -f 3 -d '/'
remove-submodule=!git submodule deinit -f -- ${1} && rm -rf .git/modules/${1} ${1}
update-submodules=!git submodule sync && git submodule update --recursive

# co) checkout
co=checkout
cob=checkout -b
cog=checkout --guess

# r)ebase
r=rebase --stat
ra=rebase --abort
rc=rebase --continue
rs=rebase --skip
ri=rebase --interactive
ris=rebase --interactive --autostash
risq=rebase --interactive --autosquash
# start rebasing from the commit before the given
rebase-from="!f() { COMMIT=$(git rev-parse ${1:-HEAD}); git rebase --autostash --interactive --stat $COMMIT^; }; f"
edit="!f() { GIT_SEQUENCE_EDITOR='sed -i -e 1s/^pick/edit/' git rebase --autostash --interactive --stat ${1:-HEAD}^; }; f"
drop="!f() { GIT_SEQUENCE_EDITOR='sed -i -e 1s/^pick/drop/' git rebase --autostash --interactive --stat ${1:-HEAD}^; }; f"
reword="!f() { GIT_SEQUENCE_EDITOR='sed -i -e 1s/^pick/reword/' git rebase --autostash --interactive --stat ${1:-HEAD}^; }; f"
# create a fixup to the given commit -> git fixup 4aa879f
fixup="!f() { COMMIT=$(git rev-parse ${1:-HEAD}); git commit --no-verify --fixup $COMMIT; }; f"
# fixup all staged changes into the given commit -> git fix 4aa879f
fix="!f() { COMMIT=$(git rev-parse ${1:-HEAD}); git commit --no-verify --fixup $COMMIT; GIT_SEQUENCE_EDITOR=: git rebase --autosquash -i $COMMIT^; }; f"
# create a squash to the given commit -> git squash 4aa879f
squash="!f() { git commit --squash ${1:-HEAD} --no-verify --no-post-rewrite; }; f"
# fixup all currently untracked files and changes into the given commit -> git fix-all 4aa879f
fix-all=!git add . && git fix ${1:-HEAD}
# squashes all currently untracked files and changes into the given commit -> git squash-all 4aa879f
squash-all=!git add . && git squash ${1:-HEAD}

# cp) cherry-pick
cp=cherry-pick
cpa=cherry-pick --abort
cpc=cherry-pick --continue
cps=cherry-pick --skip

# s)tash
s=stash
saa=stash --all
stsh=stash --keep-index
sp=stash pop
ss=stash save
sd=stash drop
sa=stash apply
sl=stash list --pretty=format:%gd
sst=stash show --patch --stat
ssw=stash show -p stash@{${1:-0}}
ssu=stash save --include-untracked
sll="!f() { for s in $(git sl); do git stash show -p $s; done; };f"

# f)etch
f=fetch
fa=fetch --all

# p(u)ll
u=pull
uf=pull --ff-only --stat --prune
ur=pull --rebase
up=pull --rebase origin HEAD
uu=!git pull --rebase origin $(git main-branch)
uup=!git pull --rebase upstream $(git main-branch)

# p)ush
p=!git push --verbose origin $(git current-branch)
pf=!git push --verbose origin $(git current-branch) --force-with-lease
pa=!git push --verbose origin $(git current-branch) --all
pt=!git push --verbose origin $(git current-branch) --tags
pc=!git push --verbose --set-upstream origin $(git current-branch)
pp=!git pull origin $(git current-branch) && git push --verbose origin $(git current-branch)

# d)iff
d=diff
today=diff --stat 'HEAD@{midnight}'
yesterday=diff --stat 'HEAD@{yesterday}' 'HEAD@{midnight}'

# re)mote
re=remote --verbose --verbose
rep=remote prune
reu=remote update --prune

# conf)ig
cg=config --global
cgs=config --global --list
confs=config --list --show-origin
confz=!git confs | fzf

# Misc
# returns the git root dir
root-dir=rev-parse --show-toplevel
pager=config --get core.pager
# remove all occurrence from repository -> git remove-files '.DS_Store'
remove-files="!f(){ find . -depth -name '$1' -exec git rm --cached '{}' \\; -print; }; f"
shorten=!sh -c 'curl -i https://git.io -F url=$1'
grep-commit=!sh -c 'grep -o \"[a-f0-9]\\{7\\}\" | cut -d\" \" -f1 | tr -d \"\\n\"'
tail=!rev | cut -d' ' -f 1 | rev
grep-branch=!sh -c 'sed \"s/^..//g\" | rev | cut -d\" \" -f 1 | rev'
head-branch=!sh -c 'sed \"s/^..//g\" | cut -d\" \" -f 1 | tr -d \"\\n\" | sed \"s@remotes/origin/@@\"'

# helpers
ignore=!${XDG[bin]:-$HOME/.config/bin}/gi
status-fancy=!${XDG[bin]:-$HOME/.config/bin}/git_status_fancy
fancy=!git status-fancy

# fzf
fzl=!git log --color=always | fzf | git grep-commit
fzdiff=!HASH=$(git diff $@ --name-only | fzf --multi --ansi --header \" git diff [ <pathspec >…​]\" --preview 'git diff $@ --color=always -- {-1}')
fza=!HASH=$(git changes | fzf -m --header \" git add --force [ <pathspec >…​]\n ^-x\t-> git restore [ <pathspec >…​]\nﮦ ^-s\t-> git restore --staged [ <pathspec >…​]\" --preview 'git diff $@ --color=always -- {-1}' --bind 'ctrl-x:reload(git restore $(cut -d \" \" -f3 <<<{}) 1>/dev/null && git changes)' --bind 'ctrl-u:reload(git restore --staged $(cut -d \" \" -f3 <<<{}) 1>/dev/null && git changes)' | git tail) && git add $(echo ${HASH} | awk '{ print $0 }') && git status
fzu=!HASH=$(git unstaged | fzf -m --header \" git restore [ <pathspec >…​]\" --preview 'git diff $@ --color=always -- {-1}' | git tail) && git restore -- $(echo ${HASH} | awk '{ print $0 }') && git st -b
fzus=!HASH=$(git staged | fzf -m --header \" git restore --staged [ <pathspec >…​]\" --preview 'git diff $@ --color=always -- {-1}' | git tail) && git restore --staged -- $(echo ${HASH} | awk '{ print $0 }') && git st -b
fzc=!HASH=$(git branches | fzf --header \" git checkout --guess [ <branch >]\" | git head-branch) && [[ -n \"${HASH}\" ]] && git checkout --guess $(echo ${HASH} | awk '{ print $1 }')
fzbd=!HASH=$(git branches | fzf --header \" git branch -d [ <branch >]\" | git head-branch) && [[ -n \"${HASH}\" ]] && git branch -d $(echo ${HASH} | awk '{ print $1 }')
fzbx=!HASH=$(git branches | fzf --header \" git branch -D [ <branch >]\" | git head-branch) && [[ -n \"${HASH}\" ]] && git branch -D $(echo ${HASH} | awk '{ print $1 }')
fzr=!HASH=$(git log --color=always | fzf --header \" git rebase --autostash --interactive --stat [ <options >]^\n\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git rebase-from $(echo ${HASH} | awk '{ print $1 }')
fzf=!HASH=$(git log --color=always | fzf --header \" git fixup [ <pathspec >…​]\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git fix $(echo ${HASH} | awk '{ print $1 }') && git st -b
fzw=!HASH=$(git log --color=always | fzf --header \" git reword [ <options >]\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git reword $(echo ${HASH} | awk '{ print $1 }')
fze=!HASH=$(git log --color=always | fzf --header \" git edit [ <options >]\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git edit $(echo ${HASH} | awk '{ print $1 }')
fzd=!HASH=$(git log --color=always | fzf --header \" git drop [ <options >]\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git drop $(echo ${HASH} | awk '{ print $1 }')
fzhs=!HASH=$(git log --color=always | fzf --header \" git reset --soft [ <options >]^\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git reset --soft $(echo ${HASH} | awk '{ print $1\"^\" }') && git st -b
fzhh=!HASH=$(git log --color=always | fzf --header \" git reset --hard [ <options >]^\" | git grep-commit) && [[ -n \"${HASH}\" ]] && git reset --hard $(echo ${HASH} | awk '{ print $1\"^\" }') && git st -b
fzunstage=!HASH=$(git staged | sed -E 's/(M|A|D)  //' | fzf --header-lines=1 --multi --ansi --header ' git rm --cached <file>...' --prompt='Files to unstage ❯ ' --preview 'bat --color=always --style=numbers {}' | git tail) && [[ -n \"${HASH}\" ]] && echo ${HASH} | tr '\n' ' ' | xargs git rm --cached
