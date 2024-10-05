# I wanted to create a pomodoro app using bash, so... i just made it.
# Made by: TatoNaranjo
#!/bin/bash

# Initial variables
NAME="POMODORO"
WORK_TIME=1500
BREAK=300
LONG_BREAK=900
ROUNDS=2
CYCLES=1
POMO_COUNTER=0


# Countdown of the selected timer, it receives an determinated time to count backwards
function countdown(){
  local SECONDS=$1
  while [ $SECONDS -gt 0 ]; do
    echo -ne "$((SECONDS / 60)):$(printf "%02d" $((SECONDS % 60)))\r"
    sleep 1
    ((SECONDS--))
  done
  echo -ne "\n"
}


# App loop to init the pomodoro
while true; do
  # Work time countdown and message. Every time it happens, Pomodoro's Counter Increases
  echo "Comienza el pomodoro de 25 minutos, que te rinda!"
  countdown $WORK_TIME
  ((POMO_COUNTER++))


  if ((POMO_COUNTER % 4 == 0)); then 
    echo "Te ganaste la pausa de 15 minutos, estira las piernas."
    countdown $LONG_BREAK
  else
    echo "Tiempo de una pausa corta de 5 minutos, ve por algo de comer."
    countdown $BREAK
  fi

  notify-send "POMODORO" "INTERVALO COMPLETADO, BUEN TRABAJO!"
done
