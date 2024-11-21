ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := hello_Lab6.o
ccflags-y += -g
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp hello_Lab6.ko hello_Lab6.ko.unstripped
	$(CROSS_COMPILE)strip -g hello_Lab6.ko
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
%.s %.i: %.c # just use make hello_Lab6.s instead of objdump
$(MAKE) -C $(KDIR) M=$$PWD $@
endif

