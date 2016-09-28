# Notes
### on procedures, commands, and information needful for this project

---

### Opening the control shell

The control shell is called `mavproxy.py`, it is linked into the standard system search path on `copterbrain1`.
It needs the communication device to be specified:
```
mavproxy.py --master=/dev/ttyAMA0
```

##### Expected behavior

The control shell gives output like this when it is working:
```
duress@copterbrain1:~ $ mavproxy.py --master=/dev/ttyAMA0
Connect /dev/ttyAMA0 source_system=255
Log Directory: 
Telemetry log: mav.tlog
MAV> Waiting for heartbeat from /dev/ttyAMA0
fence breach
height 10
online system 1
STABILIZE> Mode STABILIZE

STABILIZE> APM: APM:Copter V3.4-dev (569a7a4a)
APM: PX4: 7fcac763 NuttX: 579e82d4
APM: Frame: QUAD
APM: PX4v2 00450035 3135510E 35333436
```

##### Incorrect behavior

When something is not configured properly, or you don't specify the control device,
the MAVlink is very slow and shell hangs at "Waiting for heartbeat":
```
duress@copterbrain1:~ $ mavproxy.py
Auto-detected serial ports are:
Connect 0.0.0.0:14550 source_system=255
Log Directory: 
Telemetry log: mav.tlog
MAV> Waiting for heartbeat from 0.0.0.0:14550
```

##### Debugging the control channel

Your user needs to be in the dialout group in order to use serial devices:
```
duress@copterbrain1:~ $ groups $USER
duress : duress dialout
```
If enabled properly, the device file `/dev/ttyAMA0` should have been created at boot time. This corresponds to the GPIO serial console.
Additionally, ensure that the GPIO pins used for the control channel are in mode `ALT0`. These pins are numbered 15 and 16 in the wPi column.
```
duress@copterbrain1:~ $ ls -l /dev/ttyAMA0
crw-rw---- 1 root dialout 204, 64 Aug  4 10:23 /dev/ttyAMA0
duress@copterbrain1:~ $ gpio readall
 +-----+-----+---------+------+---+--B Plus--+---+------+---------+-----+-----+
 | BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
 +-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
 |     |     |    3.3v |      |   |  1 || 2  |   |      | 5v      |     |     |
 |   2 |   8 |   SDA.1 |   IN | 1 |  3 || 4  |   |      | 5V      |     |     |
 |   3 |   9 |   SCL.1 |   IN | 1 |  5 || 6  |   |      | 0v      |     |     |
 |   4 |   7 | GPIO. 7 |   IN | 1 |  7 || 8  | 1 | ALT0 | TxD     | 15  | 14  |  <--
 |     |     |      0v |      |   |  9 || 10 | 1 | ALT0 | RxD     | 16  | 15  |  <--
 |  17 |   0 | GPIO. 0 |   IN | 0 | 11 || 12 | 0 | IN   | GPIO. 1 | 1   | 18  |
 |  27 |   2 | GPIO. 2 |   IN | 0 | 13 || 14 |   |      | 0v      |     |     |
 |  22 |   3 | GPIO. 3 |   IN | 0 | 15 || 16 | 0 | IN   | GPIO. 4 | 4   | 23  |
 |     |     |    3.3v |      |   | 17 || 18 | 0 | IN   | GPIO. 5 | 5   | 24  |
 |  10 |  12 |    MOSI |   IN | 0 | 19 || 20 |   |      | 0v      |     |     |
 |   9 |  13 |    MISO |   IN | 0 | 21 || 22 | 0 | IN   | GPIO. 6 | 6   | 25  |
 |  11 |  14 |    SCLK |   IN | 0 | 23 || 24 | 1 | IN   | CE0     | 10  | 8   |
 |     |     |      0v |      |   | 25 || 26 | 1 | IN   | CE1     | 11  | 7   |
 |   0 |  30 |   SDA.0 |   IN | 1 | 27 || 28 | 1 | IN   | SCL.0   | 31  | 1   |
 |   5 |  21 | GPIO.21 |   IN | 1 | 29 || 30 |   |      | 0v      |     |     |
 |   6 |  22 | GPIO.22 |   IN | 1 | 31 || 32 | 0 | IN   | GPIO.26 | 26  | 12  |
 |  13 |  23 | GPIO.23 |   IN | 0 | 33 || 34 |   |      | 0v      |     |     |
 |  19 |  24 | GPIO.24 |   IN | 0 | 35 || 36 | 0 | IN   | GPIO.27 | 27  | 16  |
 |  26 |  25 | GPIO.25 |   IN | 0 | 37 || 38 | 0 | IN   | GPIO.28 | 28  | 20  |
 |     |     |      0v |      |   | 39 || 40 | 0 | IN   | GPIO.29 | 29  | 21  |
 +-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
 | BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
 +-----+-----+---------+------+---+--B Plus--+---+------+---------+-----+-----+
```
If these settings are incorrect, run `raspi-config` and disable serial login console with the following menu path:
  - Advanced Settings
  - Serial
  - No
  
This should ensure that uart is enabled at boot time, getty is not trying to attach to `/dev/ttypAMA0`, and that the GPIO pinout settings are correct:
```
duress@copterbrain1:~ $ grep uart /boot/config.txt 
enable_uart=1
duress@copterbrain1:~ $ grep -c ttyAMA /boot/cmdline.txt 
0
duress@copterbrain1:~ $ systemctl list-unit-files | grep serial-getty
serial-getty@.service                        disabled
serial-getty@ttyAMA0.service                 masked  
```

---

### Modifying the firmware

##### Source the environment

In order to compile the firmware source, some environment variables are required:
`source <REPO_ROOT>/EXPORTS.sh`
