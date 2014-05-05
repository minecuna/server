GREEN="\[\033[0;32m\]"
RED="\[\033[0;31m\]"
WHITE="\[\033[0;37m\]"

TIME="\[\$(date +%H:%M:%S)\]"

PS1="$RED$TIME $GREEN\h $WHITE\W$WHITE\n$ "
