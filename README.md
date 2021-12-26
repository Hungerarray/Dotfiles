# Dotfiles
Personal dotfiles


## Starting from scratch
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Installing on new system
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
```
echo ".cfg" >> .gitignore
```
```
git clone --bare https://github.com/hungerarray/dotfiles $HOME/.cfg
```
```
config checkout
```

## After Installation
```
config config --local status.showUntrackedFiles no
```

courtesy of: [Atlassian Bitbucket](https://www.atlassian.com/git/tutorials/dotfiles)
