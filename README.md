The Ruby interpreter and the dicordrb gem are required to host dnbot:

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
copy `blank.config.rb` to a new file called `config.rb` and fill in the values in the copied file before running main.rb:
```
./main.rb
```
##### main.rb must be run from the src directory
