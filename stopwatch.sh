#!/bin/bash
# Authors: pdolinic, GPT-4
stopwatch() { start_time=$(date +%s%N) && current_time=$(date +'%Y-%m-%d %H:%M:%S') && echo "Stopwatch started at $current_time. Press ENTER to stop."; enter="x"; while [ ! -z "${enter+x}" ]; do end_time=$(date +%s%N) && elapsed_time=$(( (end_time - start_time) / 1000000 )) && elapsed_minutes=$(( elapsed_time / 60000 )) && elapsed_seconds=$(( (elapsed_time / 1000) % 60 )) && elapsed_milliseconds=$(( elapsed_time % 1000 )) && printf "\rElapsed time: ${elapsed_minutes}m ${elapsed_seconds}.${elapsed_milliseconds}s"; read -r -s -t 1 enter; done; echo ""; }; stopwatch
