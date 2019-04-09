#!/bin/bash

# --- Apply your changes if needed ---
DEFAULT_PWM_PATH=/sys/class/pwm/pwmchip0
PWM_DEV_NUM=0
# This should set the PWM frequency to 10 kHz and set the duty cycle to 6 kHz
PWM_PERIOD=10000
PWM_DUTY_CYCLE=6000

# --- Do not change code below ---
set -e
set +x

if [ -d "$DEFAULT_PWM_PATH" ] ; then
    cd /sys/class/pwm/pwmchip0
else
    echo "No $DEFAULT_PWM_PATH! Check if kernel module is loaded."
    echo "Run lsmod | grep pwm: "
    lsmod | grep pwm
    exit 1
fi

CUR_PWM_PATH=$DEFAULT_PWM_PATH/pwm$PWM_DEV_NUM

if [ -d "$CUR_PWM_PATH" ] ; then
    echo "There is already exported pwm $PWM_DEV_NUM"
    echo "   at $CUR_PWM_PATH"
    echo "Will unexport it."
    echo $PWM_DEV_NUM > $DEFAULT_PWM_PATH/unexport
fi

echo "Export the pwm $PWM_DEV_NUM"
echo "   at $CUR_PWM_PATH"
echo $PWM_DEV_NUM > export

cd $CUR_PWM_PATH

echo "Setup pwm:"
echo "    period = $PWM_PERIOD"
echo "    duty cycle = $PWM_DUTY_CYCLE"

echo $PWM_PERIOD > period
echo $PWM_DUTY_CYCLE > duty_cycle

echo 1 > enable

echo "Done. See debug here (tail /sys/kernel/debug/pwm):"
echo "- - -"
tail /sys/kernel/debug/pwm
echo "- - -"
