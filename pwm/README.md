# Use PWM over Linux sysfs

This script allows you to use [PWM](https://en.wikipedia.org/wiki/Pulse-width_modulation) via [sysfs](https://en.wikipedia.org/wiki/Sysfs).

## Customize script

There is header in `pwmviasysfs.sh` with predefined values:
```
# --- Apply your changes if needed ---
DEFAULT_PWM_PATH=/sys/class/pwm/pwmchip0
PWM_DEV_NUM=0
# This should set the PWM frequency to 10 kHz and set the duty cycle to 6 kHz
PWM_PERIOD=10000
PWM_DUTY_CYCLE=6000
```

Change it to fit your needs.

## Run script

You need to be root to run it (or run it via sudo):

```
sudo ./pwmviasysfs.sh
```

