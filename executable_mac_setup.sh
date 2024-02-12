#!/bin/bash

# Change the whitespace between status bar icons in the top right corner
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6

# After running these commands, you need to log out and log back in
