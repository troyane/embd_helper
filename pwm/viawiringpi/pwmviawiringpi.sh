#!/bin/bash

# --- Apply your changes if needed ---
PWM_PIN=1
PWM_LOW=200   # (0-1023 is supported)
PWM_HIGH=800  # (0-1023 is supported)
SLEEP_TIME=2s # specify amount of time between different pwm signals

# --- Do not change code below ---
set -e
set +x
echo "Looking for gpio from WiringPi:"
which gpio || echo "Can't find gpio. Exit." && exit 1

echo "Unexport pin #$PWM_PIN"
gpio unexport $PWM_PIN

echo "Will "
while true; do
  gpio pwm $PWM_PIN $PWM_LOW
  sleep $SLEEP_TIME
  gpio write $PWM_PIN $PWM_HIGH
  sleep $SLEEP_TIME
done
