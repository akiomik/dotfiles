#!/bin/sh

export HOMEBREW_NO_AUTO_UPDATE=1

# initialize
file=`dirname $0`/Brewfile
cat /dev/null > $file

# write taps
taps=`brew tap`
for tap in $taps; do
    echo "tap '$tap'" >> $file
done

# write leaves
leaves=`brew leaves`
for leaf in $leaves; do
    echo "brew '$leaf'" >> $file
done

# write casks
casks=`brew cask list`
for cask in $casks; do
    echo "cask '$cask'" >> $file
done

echo "$file generated successfully."
