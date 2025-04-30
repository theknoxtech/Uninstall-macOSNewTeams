#!/bin/bash

# Quit Teams
pkill -9 -f "Microsoft Teams"

# Check for Teams app
if [ -d "/Applications/Microsoft Teams.app" ]; then

    echo "Quitting Teams"
    pkill -9 -f "Microsoft Teams"

    echo "Uninstalling Teams"
    sudo rm -rf "/Applications/Microsoft Teams.app"

else
  echo "App is not installed"
fi
sudo rm -rf "/Applications/Microsoft Teams.app"
