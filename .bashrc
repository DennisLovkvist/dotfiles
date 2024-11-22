#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -n "$DISPLAY" ]; then


	OUTPUT=$(xrandr | grep -E "DP-[0-9]+ connected" | awk '{print $1}')


	AVAILABLE_RESOLUTIONS=$(xrandr | grep -A10 "^"$OUTPUT" connected" | grep -oP '^[ ]*\K[0-9]+x[0-9]+')

	if   echo "$AVAILABLE_RESOLUTIONS" | grep -qw "5120x1440"; then

    		xrandr --output "$OUTPUT" --mode "5120x1440"

	elif echo "$AVAILABLE_RESOLUTIONS" | grep -qw "2560x1440"; then

    		xrandr --output "$OUTPUT" --mode "2560x1440"

	fi

fi

alias dropbox='HOME=/mnt/cryptdata dropbox start'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

neofetch
