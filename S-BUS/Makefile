# Makefile for creating initramfs

INITRAMFS_CPIO := initramfs.cpio
INITRAMFS_CPIO_GZ := initramfs.cpio.gz

all: $(INITRAMFS_CPIO_GZ)
	mv initramfs.cpio.gz ../initramfs.cpio.gz

$(INITRAMFS_CPIO):
	rm -rf initramfs.cpio.gz
	mkdir -p etc dev proc sys etc/init.d
	mv ./rcS etc/init.d/rcS
	find . | cpio -o --format=newc > $@

$(INITRAMFS_CPIO_GZ): $(INITRAMFS_CPIO)
	gzip -9 $<

clean:
	rm -f $(INITRAMFS_CPIO) $(INITRAMFS_CPIO_GZ)

.PHONY: all clean
