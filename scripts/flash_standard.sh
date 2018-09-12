#!/bin/sh

echo '### Erase flash ###'
#esptool.py --chip esp32 --port $AMPY_PORT erase_flash

echo '### Flash microPython ###'
esptool.py --chip esp32 --port $AMPY_PORT write_flash -z 0x1000 firmware/esp32-20180906-v1.9.4-494-ge814db592.bin
echo '### Make directories ###'
#ampy mkdir configuration
#ampy mkdir lib
#ampy mkdir lib/aiko
#ampy mkdir lib/umqtt
#ampy mkdir applications

echo '### Copy configuration/*.py ###'
ampy put configuration/main.py      configuration/main.py
ampy put configuration/led.py       configuration/led.py
ampy put configuration/lolibot.py   configuration/lolibot.py
ampy put configuration/mqtt.py      configuration/mqtt.py
ampy put configuration/net.py  configuration/net.py
ampy put configuration/oled.py      configuration/oled.py
ampy put configuration/services.py  configuration/services.py

echo '### Copy lib/aiko/*.py ###'
ampy put lib/aiko/demonstration.py  lib/aiko/demonstration.py
ampy put lib/aiko/event.py          lib/aiko/event.py
ampy put lib/aiko/led.py            lib/aiko/led.py
ampy put lib/aiko/mqtt.py           lib/aiko/mqtt.py
ampy put lib/aiko/net.py            lib/aiko/net.py
ampy put lib/aiko/oled.py           lib/aiko/oled.py
ampy put lib/aiko/services.py       lib/aiko/services.py

echo '### Copy lolibot.py ###'
ampy put lib/lolibot.py lib/lolibot.py

echo '### Copy mpu9250.py ###'
ampy put lib/mpu9250.py lib/mpu9250.py

echo '### Copy ssd1306.py ###'
ampy put lib/ssd1306.py lib/ssd1306.py

echo '### Copy threading.py ###'
ampy put lib/threading.py lib/threading.py

echo '### Copy ms5611.py ###'
ampy put lib/ms5611.py lib/ms5611.py

echo '### Copy sgp30.py ###'
ampy put lib/sgp30.py lib/sgp30.py

echo '### Copy lib/umqtt ###'
ampy put lib/umqtt/simple.py lib/umqtt/simple.py
ampy put lib/umqtt/robust.py lib/umqtt/robust.py

echo '### Copy play.py ###'
#ampy put play.py play.py

ampy put applications/logTemperature.py applications/logTemperature.py
echo '### Copy main.py ###'
ampy put main.py main_test.py

echo '### Complete ###'

# screen $AMPY_PORT 115200
