CC=gcc
CFLAGS= -g -m32
LIBS= -lessfunc
ODIR=.obj

libessfunc.so: 
	$(CC) $(CFLAGS) -shared essfunc.c -o $@ 

vulnserver: libessfunc.so
	$(CC) $(CFLAGS) vulnserver.c -o $@ libessfunc.so

all: vulnserver

.PHONY: clean

clean:
	rm -f *.o *~ core *~ *.so
