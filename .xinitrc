
dwm_status_bar &

if [ -n "$DISPLAY" ]; then


        OUTPUT=$(xrandr | grep " connected" | awk '{print $1}')

        AVAILABLE_RESOLUTIONS=$(xrandr | grep -A10 "^"$OUTPUT" connected" | grep -oP '^[ ]*\K[0-9]+x[0-9]+')

        if   echo "$AVAILABLE_RESOLUTIONS" | grep -qw "5120x1440"; then

                xrandr --output "$OUTPUT" --mode "5120x1440"

        elif echo "$AVAILABLE_RESOLUTIONS" | grep -qw "2560x1440"; then

                xrandr --output "$OUTPUT" --mode "2560x1440"
        fi

        xset s off         # Disable screen saver
        xset -dpms         # Disable DPMS (Energy Star) features
        xset s noblank     # Disable screen blanking

fi
exec dwm
