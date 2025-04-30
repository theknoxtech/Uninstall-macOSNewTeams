#!/bin/bash
# Store the script at /Users/Shared
cd /Users/Shared
sleep 1

localuser=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }')

echo "localuser: '$localuser'"

if [ -z ${localuser} ]; then
    echo "No user is currently logged in."
    exit
fi

sudo -u "$localuser" /bin/bash <<EOF
    mkdir /Users/$localuser/Desktop/ScriptTest
    if [ -d "/Users/$localuser/Library/Group Containers/UBF8T346G9.com.microsoft.teams" ]; then
        rm -rf /Users/$localuser/Library/Group\ Containers/UBF8T346G9.com.microsoft.teams
	    rm -rf /Users/$localuser/Library/Containers/com.microsoft.teams2
    else
        echo "directory: $HOME/Library/Group Containers/UBF8T346G9.com.microsoft.teams does not exist."
    fi
EOF