#!/bin/sh

cut -d "/" -f 4- | grep -v -e '\.git' -e '\.cache' -e '\.local' -e '\.mozilla'\
    -e '^R/' -e '\.vim' -e '\.cpan'
