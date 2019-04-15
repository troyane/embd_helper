# Use PWM over WiringPi

> WiringPi here stands for variaty of implementations: WiringOP for OrangePi's, WiringNP for NanoPi's.

This script allows you to use [PWM](https://en.wikipedia.org/wiki/Pulse-width_modulation) via [WiringPi's GPIO utility](https://projects.drogon.net/raspberry-pi/wiringpi/the-gpio-utility/).

## Customize script

There is header in `pwmviawiringpi.sh`. Change it to fit your needs.
```
# --- Apply your changes if needed ---
PWM_PIN=1
PWM_LOW=200   # (0-1023 is supported)
PWM_HIGH=800  # (0-1023 is supported)
SLEEP_TIME=2s # specify amount of time between different pwm signals
```

## Run script

You need to be root to run it (or run it via sudo):

```
sudo ./pwmviawiringpi.sh
```
