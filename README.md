The Ruby interpreter and the dicordrb gem are required to host crevolute:

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
CRTOKEN=[token] CRNID=[id] ./main.rb
```
##### main.rb must be run from the src directory
