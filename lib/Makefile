
libpony-aa.so: pony-aa.c
	gcc -shared -Wl,-soname,libpony-aa.so -o libpony-aa.so pony-aa.c

build: libpony-aa.so

install: libpony-aa.so
	sudo cp libpony-aa.so /usr/lib64/
	sudo ldconfig

.PHONY: build install
