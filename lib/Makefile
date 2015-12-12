
libpony-unsafe.so: pony-unsafe.c
	gcc -shared -Wl,-soname,libpony-unsafe.so -o libpony-unsafe.so pony-unsafe.c

build: libpony-unsafe.so

install: libpony-unsafe.so
	sudo cp libpony-unsafe.so /usr/lib64/
	sudo ldconfig

.PHONY: build install
