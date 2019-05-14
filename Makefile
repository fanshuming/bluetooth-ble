CC=arm-linux-gnueabihf-gcc
CFLAGS=-DHAVE_CONFIG_H  -I. -I./include -I./lib -I/usr/arm-linux-gnueabi/include/dbus-1.0 -I/usr/arm-linux-gnueabi/lib/dbus-1.0/include -I/usr/arm-linux-gnueabi/include/glib-2.0 -I/usr/arm-linux-gnueabi/lib/glib-2.0/include -I/usr/arm-linux-gnueabi/lib/glib-2.0/include -g -O2 

LDFLAGS=src/.libs/libshared-mainloop.a lib/.libs/libbluetooth-internal.a

ALL:btgatt_server

btgatt-server.o:
	${CC} ${CFLAGS} -c -o src/btgatt-server.o src/btgatt-server.c

uuid-helper.o:
	${CC} ${CFLAGS} -c -o src/uuid-helper.o src/uuid-helper.c

btgatt_server: src/uuid-helper.o btgatt-server.o
	${CC}  ${CFLAGS} -o bin/btgatt-server src/btgatt-server.o src/uuid-helper.o   ${LDFLAGS}

clean:
	rm -f src/uuid-helper.o src/btgatt-server.o bin/btgatt-server
	
