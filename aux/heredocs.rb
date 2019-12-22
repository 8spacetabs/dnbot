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
+ ;ping
  - unix ping command: `;ping 1.0.0.1`

+ ;roles
  - if no arguments are specified displays all available roles:
        `;roles`
  - if arguments are specified adds/removes roles from executing user:
        `;roles (add|remove) role ..`    

+ ;time
  - shows the time via Ruby's Time#now()

+ ;uptime
  - shows the bot's uptime

+ ;sysuptime
  - shows the bot's host's uptime via /usr/bin/uptime

+ ;echo
  - unix echo command

+ ;vote
  - start a yes/no vote

+ ;poll
  - start a poll for up to 10 options

+ ;help
  - display this help message
```
HEREDOC

