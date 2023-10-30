#!/bin/bash
# |______________________Simple tor launcher_____________________|
# |                 For launching tor automaticly                |
# |______________________________________________________________|
# |> Made by: 
# |> CPScript | Disease
# |> kirakenjiro | Kira (freind from discord)

# Are you root check
if [[ $EUID -ne 0 ]]; then
  echo You are root!
  sleep 1
  clear

  echo For extra security do one of the following:
  echo 1. Use VPN (virtual private network)
  echo 2. Use VM (Virtual machine)
  echo 3. Use USB (run this script on a disposable USB)
  sleep 6
  clear
  
  echo Launching tor before running script, please wait...
  sleep 2
  clear

  tor

  # Tor identity
  newnym() {
    echo -n "AUTHENTICATE" | nc 127.0.0.1 9051
    echo -n "SIGNAL NEWNYM" | nc 127.0.0.1 9051
  }

  # Download the repo
  git clone https://github.com/CPScript/Tor-Launcher

  # Change Dir
  cd Tor-Launcher/extra

  # Launch script
  ./good.txt

else
  # Not rooted message | How to root
  echo Please root!
  sleep 2
  echo Example on how to root your terminal:
  echo sudo su (might require a password)
fi
