#!/bin/bash

###############################################################################
# CD to this directory, and store off the full path to it for use later.
###############################################################################
pushd $(dirname $0) > /dev/null
THIS_DIR=$(pwd)

###############################################################################
# Ensure that all plugin submodules have been fully checked out.
###############################################################################
printf "Ensuring all plugins are properly checked out...\t"
if git submodule update --init --recursive; then
    printf "[Done]\n"
else
    printf "[FAILED]\n"
    printf "\nFailure during setup. Aborting."
    popd > /dev/null
    exit 1
fi

###############################################################################
# Remove any existing .vim or .vimrc symlinks.
###############################################################################
unlink $HOME/.vimrc > /dev/null 2>&1
unlink $HOME/.vim > /dev/null 2>&1

###############################################################################
# Set up symlinks to the vim folder and the vimrc file so that vim can find
# the config in this repository.
###############################################################################
printf "Creating symbolic links to vim folder and .vimrc...\t"
RES1=$(ln -sf $THIS_DIR/.vimrc $HOME/.vimrc)
RES2=$(ln -sf $THIS_DIR $HOME/.vim)
if $RES1 && $RES2; then
    printf "[Done]\n"
else
    printf "[FAILED\n"
    printf "\nFailure during setup. Aborting."
    unlink $HOME/.vimrc
    unlink $HOME/vim
    popd /dev/null
    exit 2
fi

###############################################################################
# Restore the previous working directory.
###############################################################################
popd > /dev/null
