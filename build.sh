#!/bin/sh
cd `dirname $0`/build
ant clean && ant pcduino-build 
# rm -rf ~/.arduino15 && ant pcduino-run # Run arduino built
# rm -rf ~/.arduino15 && cd linux/work && ./arduino # Run arduino built directly without relaunching ant check steps
# echo "1.8.6_beta_pcDuino_mathoudebine" | ant pcduino-dist # Package arduino built (/!\ My PcDuino3 Nano has hanged here, cannot do this step)
