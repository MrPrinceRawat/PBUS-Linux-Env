# Makefile.iso for creating ISO

KERNEL := linux-6.1.64/arch/x86_64/boot/bzImage

S-BUS.iso: syslinux/bios/core/isolinux.bin ./initramfs.cpio.gz
	-rm -rf isodir
	mkdir -p isodir/isolinux
	cp isolinux.cfg isodir/isolinux
	cp boot.txt isodir/isolinux
	cp syslinux/bios/core/isolinux.bin isodir/isolinux
	cp syslinux/bios/com32/elflink/ldlinux/ldlinux.c32 isodir/isolinux
	cp ./initramfs.cpio.gz isodir/isolinux
	cp $(KERNEL) isodir/isolinux

	mkisofs -V LFSISO -o S-BUS.iso -b isolinux/isolinux.bin -c isolinux/boot.cat \
		-no-emul-boot -boot-load-size 4 -boot-info-table -iso-level 3 -f -R isodir
	isohybrid S-BUS.iso
