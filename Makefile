CC=gcc
CFLAGS= -g -m32
LIBS= -lpthread
AR=ar

all: vulnserver

essfunc.o:
	$(CC) $(CFLAGS) -c essfunc.c -o $@

libessfunc.a: essfunc.o
	$(AR) rcs $@ $^

vulnserver: libessfunc.a
	$(CC) $(CFLAGS) vulnserver.c -o $@ libessfunc.a $(LIBS)

.PHONY: clean

clean:
	rm -f *.o *~ core *~ *.so vulnserver
