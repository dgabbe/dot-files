#!/usr/bin/env bash
#
# Written to be Bash 3.x compatible
#
# Mac OS X specific
#
mac_apps=("Aquamacs" "BBedit" "RStudio" "SourceTree")
for a in "${mac_apps[@]}"
do
  al=$(echo "$a" | tr [:upper:] [:lower:])
  if [[ -e "/Applications/${a}.app" ]]; then alias ${al}="open -a /Applications/${a}.app"; fi
done
unset mac_apps
unset a
unset al

alias gimp="/Applications/GIMP-2.10.app/Contents/MacOS/gimp" # for command line

# These should work with any *nix. Uncomment the ones you want
#
# Add an "alert" alias for long running commands.  Usage: sleep 10; alert
#
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias chex='chmod -vv u+x '
alias chp='chmod -go:rwx'   # Set files access to only owner
alias dss='diff --side-by-side'
alias fgrepi='fgrep --color=auto -i'
alias grepi='grep --color=auto -i'

# some more ls aliases
#
# Decoder as some options are infrequently used
#  a: Include directory entries whose names begin with a dot
#  l: Long format - one per line
#  F: Describe entry - /, *, @, =
#  d: Directories are listed as plain files (not searched recursively)
#  e: Print the Access Control List (ACL) associated with the file
#  G: Enable colorized output
#  h: use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte
#  A: Don't list . and .. entries
#  C: Force multi-column output
#  O: File flags
#
alias l='ls -CF'
alias ld='ls -d'         # treat directory as a file
alias la='ls -A'
alias lf='ls -lOde'      # list permissions, flags, acls, extended attributes
alias ll='ls -alFeGhO'
alias lx='xattr -lv'     # List the extended file attributes

alias mkdirp='mkdir -m -go:rex' # The Apple way of keeping things private
alias rmquar='xattr -rd com.apple.quarantine'  # Get applications out of Apple's quarantine
alias tagbrew='tag --add brew-installed /Applications/'

#
# Ruby related
#
#alias path='ruby -e "puts ENV[\"PATH\"].gsub(/:/, \"\n\")"'
#alias pretty_json='ruby -r json -e '\''txt = File.read(ARGV[0]); h = JSON.parse(txt); puts JSON.pretty_generate(h)'\'''
#alias tabify='ruby -pe '\''gsub(/ +/, "\t")'\'''
