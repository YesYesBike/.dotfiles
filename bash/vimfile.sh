arg=$(find ~ -type f | ~/bash/./dirsed.sh | fzf)
if [[ -n $arg ]]; then 
    nvim $arg
fi
