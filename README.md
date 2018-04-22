Arduino IDE for PcDuino
========

This repository contains the Arduino IDE 1.8.6 edited to include PcDuino support.  
It has been created since Arduino IDE for PcDuino platform is no longer maintained by LinkSprite (latest official version is 1.5.3).  
This IDE has been tested on a PcDuino3 Nano with official **Linaro 14.04** from LinkSprite, it may work for other PcDuino boards that already support Arduino IDE.  
This IDE version has to be built directly on the PcDuino. **Ubuntu/Linaro 14.04 running on a SD card** is recommended since it needs a lot of free space on the filesystem to build.  

Warning
--------
It is recommended to continue using the Arduino IDE supplied with your board firmware.  
This version is UNSTABLE and may not work as intended.  
Note that this version will not replace your original Arduino IDE, so you can have both on your system.  

**Disclaimer**: I give no guarantees and decline all responsibility for your failure or success using this software.  

Pre-requisites
--------
* Ubuntu/Linaro 14.04 from LinkSprite for your board, e.g. for PcDuino 3 Nano/B : https://s3.amazonaws.com/pcduino/Images/v3/ubuntu14/pcduino3b_nano_dd_1404.zip  
Use this SD image to flash your NAND, then make a bootable SD (at least 8 GB) : http://learn.linksprite.com/pcduino/quick-start/how-can-i-use-a-sd-with-large-capacity-as-my-primary-medium/  

* Fixed Linaro/Ubuntu 14.04 repositories:
`/etc/apt/sources.list` :
```
deb http://ports.ubuntu.com/ubuntu-ports/ trusty main universe
deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty main universe
deb http://ports.ubuntu.com/ubuntu-ports/ trusty-security main universe
deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty-security main universe
deb http://ports.ubuntu.com/ubuntu-ports/ trusty-updates main universe
deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty-updates main universe
#deb http://www.wiimu.com:8020/pcduino/ pcduino main
#deb-src http://www.wiimu.com:8020/pcduino/ pcduino main
```
/!\ Do not add the **ubuntu.pcduino.com** repositories they are **only for Linaro 12**, you would break your packages dependencies

* Development packages for the build :
```bash
sudo apt-get install ant gcc git make
```

* Java 8 :
```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

Build / Run / Package the IDE
--------
All the following commands have to be run in the "build/" subfolder of this repository :

* Build :
```bash
ant clean
ant pcduino-build
```

* Run :
```bash
ant pcduino-run
```
or without relaunching ant build system :
```bash
cd linux/work/
./arduino
```

* Package :
```bash
ant pcduino-dist
```
NOTE : packaging the IDE may freeze the board. Not fully tested.

Troubleshoot
--------

Q: My PcDuino board is not listed anymore in the boards menu !  
A: Close the IDE, remove the folder `~/.arduino15` and restart the IDE  

Q: Where are my compiled sketches ?  
A: For now they are in `build/linux/work/` and their name is litteraly `{sketchbook.path}`. It seems that the `{sketchbook.path}` variable from `hardware/arduino/pcduino/platform.txt` is not interpreted anymore, I have not investigated.  

Q: I constantly have the message `Inavlid library found in /home/linaro[...]` when starting my IDE / when building a sketch  
A: To fix this, replace the file `build/linux/work/hardware/platform.keys.rewrite.txt` by the one from this repository, and restart the IDE  

Q: I have the message `Warning: platform.txt from core 'pcDuino Boards' contains deprecated recipe.ar.pattern[...]`  
A: This is not an error but only a warning. It is not a problem and can be safely ignored.  

About Arduino IDE
--------
* Arduino is an open-source physical computing platform based on a simple I/O
board and a development environment that implements the Processing/Wiring
language. Arduino can be used to develop stand-alone interactive objects or
can be connected to software on your computer (e.g. Flash, Processing and MaxMSP).
The boards can be assembled by hand or purchased preassembled; the open-source
IDE can be downloaded for free at https://www.arduino.cc/en/Main/Software

* For more information, see the website at: https://www.arduino.cc/
or the forums at: https://forum.arduino.cc/  
You can also follow Arduino on Twitter at: https://twitter.com/arduino or
like Arduino on Facebook at: https://www.facebook.com/official.arduino

* To report a *bug* in the software or to request *a simple enhancement* go to:
https://github.com/arduino/Arduino/issues

* More complex requests and technical discussion should go on the Arduino Developers
mailing list:
https://groups.google.com/a/arduino.cc/forum/#!forum/developers

* If you're interested in modifying or extending the Arduino software, we strongly
suggest discussing your ideas on the Developers mailing list *before* starting
to work on them. That way you can coordinate with the Arduino Team and others,
giving your work a higher chance of being integrated into the official release
https://groups.google.com/a/arduino.cc/forum/#!forum/developers

Original Credits
--------
Arduino is an open source project, supported by many.

The Arduino team is composed of Massimo Banzi, David Cuartielles, Tom Igoe
and David A. Mellis.

Arduino uses
[GNU avr-gcc toolchain](https://gcc.gnu.org/wiki/avr-gcc),
[GCC ARM Embedded toolchain](https://launchpad.net/gcc-arm-embedded),
[avr-libc](http://www.nongnu.org/avr-libc/),
[avrdude](http://www.nongnu.org/avrdude/),
[bossac](http://www.shumatech.com/web/products/bossa),
[openOCD](http://openocd.org/)
and code from [Processing](https://www.processing.org)
and [Wiring](http://wiring.org.co).

Icon and about image designed by [ToDo](https://www.todo.to.it/)

