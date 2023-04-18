#!/bin/bash
# Authors: pdolinic, GPT-4
# Info: Install the "espeak" package for the audio
# Info: The script currently tells to stand up and move after 45 minutes

stopwatch() {
    start_time=$(date +%s%N)
    current_time=$(date +'%Y-%m-%d %H:%M:%S')
    echo "Stopwatch started at $current_time. Press ENTER to stop."

    enter="x"
    beep_interval=$((45 * 60)) # 45 minutes in seconds
    next_beep_time=$(( start_time + (beep_interval * 1000000000) ))

    while [ ! -z "${enter+x}" ]; do
        end_time=$(date +%s%N)
        elapsed_time=$(( (end_time - start_time) / 1000000 ))
        elapsed_minutes=$(( elapsed_time / 60000 ))
        elapsed_seconds=$(( (elapsed_time / 1000) % 60 ))
        elapsed_milliseconds=$(( elapsed_time % 1000 ))

        if [ $end_time -ge $next_beep_time ]; then
            espeak -v en+f3 "Stand up and move"
            echo "Time to stand up and move!"
            next_beep_time=$(( next_beep_time + (beep_interval * 1000000000) ))
        fi
        
        printf "\rElapsed time: ${elapsed_minutes}m ${elapsed_seconds}.${elapsed_milliseconds}s"
        read -r -s -t 1 enter
    done

    echo ""
}

stopwatch
