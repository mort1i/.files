#!/bin/bash

# Repo location
REPO="$HOME/git/dotfiles"
# Timestamp format (for backups)
TIMESTAMP=`date +%Y%m%d-%H%M%S`
# Which dotfiles to administer
DOTFILES=".bashrc .bash_aliases .tmux.conf .vimrc"

# Writing what we do
echo "Adding symlinks to dotfiles in repo"

# Loop running though the .dotfiles
for f in $DOTFILES
do
    echo "Adding $f"
    if test -f "$REPO/$f"
    then    
        if test -f "$HOME/$f"
        then
            echo "$HOME/$f already exists, moving to backup folder $REPO/backup/backup-$TIMESTAMP"
            mkdir -p $REPO/backup/backup-$TIMESTAMP
            mv $HOME/$f $REPO/backup/backup-$TIMESTAMP/
        fi
        ln -s $REPO/$f $HOME/$f
    else
        echo "Can't find $REPO/$f - is this the correct location?"
        exit 1
    fi
done

# Refreshing .bashrc
source $HOME/.bashrc
