@echo off

set name="lesson28"

set path=%path%;..\bin\

set CC65_HOME=..\

cc65 -Oi %name%.c -g --add-source
ca65 crt0.s -g
ca65 %name%.s -g

ld65 -C nrom_32k_4screen.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln labels.txt

del *.o

pause

%name%.nes
