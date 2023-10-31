#!/bin/bash
# |_________________________ tor launcher _______________________|
# |                 For launching tor automaticly                |
# |______________________________________________________________|
# |> Made by: 
# |> CPScript | Disease
# |> kirakenjiro | Kira (freind from discord)
# |> Version 3.6

# Are you root check
if [[ $EUID -ne 0 ]]; then
  echo You are root
  sleep 1
  clear

  echo For extra security do one of the following:
  echo 1. Use VPN (virtual private network)
  echo 2. Use VM (Virtual machine)
  echo 3. Use USB (run this script on a disposable USB)
  sleep 6
  clear

  # Check if Tor is installed
  if ! command -v tor &> /dev/null; then
    echo "Tor is not installed. Installing Tor, please wait..."
    sudo apt-get update
    sudo apt-get install -y tor
  fi

  # Start Tor service
  echo Starting tor service, please wait
  sudo service tor start
  sleep 2
  clear

  # Tor identity
  newnym() {
    echo -n "AUTHENTICATE" | nc 127.0.0.1 9051
    echo -n "SIGNAL NEWNYM" | nc 127.0.0.1 9051
  }

  # Retrieve user's public IP address using Tor
  echo "Retrieving your public IP address via Tor, please wait..."
  torsocks curl -s https://ipinfo.io/ip

  # Download the repo over Tor
  torsocks git clone https://github.com/CPScript/Tor-Launcher

  # Change Dir
  cd Tor-Launcher/extra

  # Launch script with Tor
  torsocks ./good.txt


else
  # Not rooted message | How to root
  echo Please root
  sleep 2
  echo Example on how to root your terminal:
  echo sudo su / might require a password
fi
