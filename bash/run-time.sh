function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  time_in_seconds=$(($SECONDS - $timer))
  timer_show=$(date -d@$time_in_seconds -u +%H:%M:%S)
  unset timer
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi
