echo off
rm kernel7.img
rm *.o
rm *.ppu
/home/pi/ultibo/core/fpc/bin/fpc -B -Tultibo -Parm -CpARMV7A -WpRPI2B @/home/pi/ultibo/core/fpc/bin/RPI2.CFG -O2 -dPLATFORM_PI2 pce_ibmpc.lpr
echo Done.