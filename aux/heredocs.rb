$roles = <<-HEREDOC
```md
BSDs
====
+ DragonFlyBSD
+ FreeBSD
+ GhostBSD
+ NetBSD
+ OpenBSD
+ TrueOS
Distros
=======
+ Alpine
+ Arch
+ Bedrock
+ Debian
+ Fedora
+ Gentoo
+ Kali
+ Manjaro
+ Mint
+ MXLinux
+ NixOS
+ OpenSUSE
+ ParrotOS
+ Raspbian
+ RedHat
+ Slackware
+ Solus
+ ubuntu
+ Void
Programming languages
=====================
+ Assembly
+ C
+ C#
+ C++
+ Clojure
+ CSS
+ Cobol
+ D
+ Elixir
+ Erlang
+ Go
+ Haskell
+ Haxe
+ HTML
+ HolyC
+ Java
+ JavaScript
+ Julia
+ Kotlin
+ Lisp
+ Objective-C
+ OCaml
+ Perl
+ PHP
+ R
+ Ruby
+ Rust
+ Scala
+ Shell
+ SQL
+ Swift
WMs/DEs
=====
+ bspwm
+ Cinnamon
+ dwm
+ GNOME
+ i3
+ KDE
+ MATE
+ Openbox
+ Unity
+ XFCE
+ Xmonad
misc
====
+ Polls
```
HEREDOC

$help_msg = <<-HEREDOC
```md
commands:
=========
+ ;help
  - display this help message

+ ;ping
  - unix ping command: `;ping [IPv4 address]`

+ ;roles
  - if no arguments are specified all available roles are listed:
        `;roles`
  - add and remove subcommands add/remove roles from executing user respectively:
        `;roles (add|remove) role1 role2 ..`    

+ ;time
  - shows the time

+ ;uptime
  - shows the bot's uptime in wall clock format

+ ;sysuptime
  - shows the bot host's uptime via /bin/uptime

+ ;echo
  - unix echo command

+ ;vote
  - start a yes/no vote

+ ;poll
  - start a poll for up to 10 options

+ ;numberphile
  - get a random numberphile video

+ ;computerphile
  - get a random computerphile video

+ ;flip
  - flip a coin

+ ;roll
  - roll a dice
```
HEREDOC
