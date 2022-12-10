obj-m += vulnerable_driver.o

all:
	make -C /lib/modules/$(uname -r)/build M=$(pwd) modules
clean:
	make -C /lib/modules/$(uname -r)/build M=$(pwd) clean

load:
	insmod vulnerable_driver.ko
	chmod 0666 /dev/vulnerable_driver
unload:
	rmmod vulnerable_driver.ko
