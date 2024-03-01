#!/bin/sh

time find ~ -type d | sed '/\.cache/d' | sed '/\.git/d' | sed '/\.local/d' | sed '/\.mozilla/d'
#real    0m0.155s
#user    0m0.063s
#sys     0m0.123s

#time find ~ -type d | grep -v -e ".cache" -e ".git" -e ".local" -e ".mozilla"
#real    0m0.150s
#user    0m0.030s
#sys     0m0.135s
