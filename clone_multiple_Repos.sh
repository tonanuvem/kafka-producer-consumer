curl -si https://api.github.com/users/tonanuvem/repos | grep kafka | grep clone_url | awk -F '":' '{ print $2 }' | sed 's/\"//g' | sed 's/,//' | while read line; do git clone "$line"; done
