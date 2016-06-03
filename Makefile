#
# Makefile for the Linux ufs filesystem routines.
#

KDIR?=/usr/src/linux-headers-$(shell uname -r)
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

obj-$(CONFIG_UFS_FS) += ufs.o

ccflags-y    += -DCONFIG_UFS_FS_WRITE

ufs-objs := balloc.o cylinder.o dir.o file.o ialloc.o inode.o \
	    namei.o super.o symlink.o util.o
ccflags-$(CONFIG_UFS_DEBUG)    += -DDEBUG

all:
	$(BUILD_VARS) make -C $(KDIR) M=$(ROOT_DIR) modules

clean:
	$(BUILD_VARS) make -C $(KDIR) M=$(ROOT_DIR) clean
