@echo off

set name="lesson26"

set path=%path%;..\bin\

set CC65_HOME=..\

cc65 -Oi %name%.c -g --add-source
ca65 crt0.s -g
ca65 %name%.s -g

ld65 -C nrom_16k_horz.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln labels.txt

del *.o

pause

%name%.nes
