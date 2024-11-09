#
# ~/.bashrc
#

#----Update screen resolution----------------------------------------------------------------------------

OUTPUT=$(xrandr | grep " connected" | awk '{print $1}')

AVAILABLE_RESOLUTIONS=$(xrandr | grep -A10 "^"$OUTPUT" connected" | grep -oP '^[ ]*\K[0-9]+x[0-9]+')

if   echo "$AVAILABLE_RESOLUTIONS" | grep -qw "5120x1440"; then

    xrandr --output "$OUTPUT" --mode "5120x1440"

elif echo "$AVAILABLE_RESOLUTIONS" | grep -qw "2560x1440"; then

    xrandr --output "$OUTPUT" --mode "2560x1440"

else
    exit 1
fi

#----Prevent screen from turning off---------------------------------------------------------------------

xset s off         # Disable screen saver
xset -dpms         # Disable DPMS (Energy Star) features
xset s noblank     # Disable screen blanking

#----Default---------------------------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

neofetch
