function pathComponents
{
    echo $1 | sed "s|^$HOME|~|" | awk -v n=$2 '{
        # Split the path into components
        componentCount = split($0, components, "/");

        # If there are less than n components, just print the whole path
        if (componentCount <= n) {
            print $0
        } else {
            # Else print the last n components
            for (i = componentCount - n + 1; i < componentCount; i++) {
                printf "%s/", components[i]
            }

            printf "%s", components[i]
        }
    }'
}

PS1='\[\e[0;31m\]`pathComponents "$PWD" 3` >\[\e[m\] '

alias ls='ls -G'
alias grep='grep --color=auto'
