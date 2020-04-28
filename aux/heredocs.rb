$roles = <<-HEREDOC
```md
Linux Distros
=============
+ Alpine
+ Arch
+ Bedrock
+ Debian
+ Fedora
+ Gentoo
+ Kali
+ LionOS
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
+ Ubuntu
+ Void
BSDs
====
+ DragonFlyBSD
+ FreeBSD
+ GhostBSD
+ NetBSD
+ OpenBSD
+ TrueOS 
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
+ Miranda
+ Objective-C
+ OCaml
+ Perl
+ Python
+ PHP
+ R
+ Ruby
+ Rust
+ Scala
+ Shell
+ SQL
+ Swift
+ TypeScript
WMs/DEs
=====
+ AwesomeWM
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

usage: ;roles (add|remove) [roles]
```
HEREDOC

$help_msg = <<-HEREDOC
```md
commands:
=========
+ ;covidstats
  - show the COVID-19 stats for your region: `;covidstats <region>`

+ ;help
  - display this help message

+ ;ping
  - shows ping stats

+ ;roles
  - if no arguments are specified all available roles are listed:
        `;roles`
  - add and remove subcommands add/remove roles from executing user respectively:
        `;roles (add|remove) role1 role2 ..`    

+ ;remindme
  - set a reminder, this command has no conformation message but it does work:
        `;remindme n (seconds|minutes|hours)`
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

+ ;flip
  - flip a coin

+ ;roll
  - roll a dice

+ ;hackerman
  - feel free to spam this but only in the presence of a skid

+ ;ask
  - for people asking if they can ask a question, please don't spam this one
```
HEREDOC

$hackerman_paste = <<-HEREDOC
Woah there! You have been s t o p p e d.
If you are seeing this you have requested or advertised an illegal service
Please git good and familiarise yourself with the following:

<https://en.wikipedia.org/wiki/Computer_Misuse_Act_1990>
<https://en.wikipedia.org/wiki/Computer_Fraud_and_Abuse_Act>

If these laws aren't relevant to you, seek out and read the ones which are.

We are not idiots. If you are trying to abuse a system which is not yours
*we will know* and *you will be banned* if you refuse to follow our rules.
HEREDOC

$ask_paste = <<-HEREDOC
When asking a technical question give as much context as possible.
If you get an error, send the error.
If your program is behaving unexpectedly, send relevant code snippets

Finally, don't ask to ask. "Can someone help me with X?" is annoying
and much less productive than just asking your question.

For further reference: <http://xyproblem.info/> <http://catb.org/esr/faqs/smart-questions.html>
HEREDOC
