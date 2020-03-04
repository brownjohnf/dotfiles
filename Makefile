.PHONY: test_arch
test_arch:
	pacman -Q qemu ovmf
	qemu-system-x86_64 \
		-bios /usr/share/ovmf/x64/OVMF_CODE.fd \
		-m 2G \
		-enable-kvm \
		-smp cores=$$(nproc) \
		-drive file=test/arch.img,format=raw

