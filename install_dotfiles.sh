#!/bin/bash

echo "Installing dotfiles"

list_of_files=(alacritty.yml dunstrc zshrc i3status.conf latexmkrc i3 tmux.conf)

for item in ${list_of_files[*]}
do
    echo "----------------------------------------"
    # pre-append . for the files
    link_name="$HOME/.$item"
    echo "$item --> $link_name"
    if test -L "$link_name"; then
        echo "$link_name exist. Skipping."
        continue
    fi

    ln -s "$(pwd)/$item" "$link_name"

done
