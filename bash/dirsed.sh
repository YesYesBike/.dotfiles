#!/bin/sh

sed '/\.cache/d' | sed '/\.git/d' | sed '/\.local/d' | sed '/\.mozilla/d' #| sed /\.R/d 
