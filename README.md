The Ruby interpreter and the dicordrb and yt gems are required to host dnbot:

# Installation

## Arch Linux:
```
sudo pacman -Syu ruby && gem install discordrb
```

## Ubuntu/Debian:
```
sudo apt install ruby && gem install discordrb
```

## FreeBSD:
```
doas pkg install ruby25-gems && gem install discordrb
```

# Usage
## All of the above:
```
DNTOKEN=[token] DNID=[id] ./dnbot.rb
```
##### dnbot only requires read-only access to the youtube analytics api
##### dnbot must be run from the src directory
