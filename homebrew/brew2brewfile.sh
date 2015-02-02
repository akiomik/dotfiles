#!/bin/sh

# initialize
file=Brewfile
cat /dev/null > $file

# write taps
taps=`brew tap`
for tap in $taps; do
    echo "tap '$tap'" >> $file
done

# write leaves
leaves=`brew leaves`
for leave in $leaves; do
    echo "brew '$leave'" >> $file
done

# write casks
casks=`brew cask list`
for cask in $casks; do
    echo "cask '$cask'" >> $file
done
