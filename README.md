![code size shield](https://img.shields.io/github/languages/code-size/c99zealot/dnbot?style=plastic)
![top language shield](https://img.shields.io/github/languages/top/c99zealot/dnbot?label=Ruby&style=plastic)
![license shield](https://img.shields.io/github/license/c99zealot/dnbot?style=plastic)

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
