SHELL := /bin/bash
DEFAULT_GOAL := test_arch

.PHONY: test_arch
test_arch: check test/arch.img
	cp test/arch.img /tmp/dotfiles-test_arch.img
	qemu-system-x86_64 \
		-bios /usr/share/ovmf/x64/OVMF_CODE.fd \
		-m 2G \
		-enable-kvm \
		-smp cores=$$(nproc) \
		-drive file=/tmp/dotfiles-test_arch.img,format=raw

test/arch.img:
	(cd /data/archiso && make clean && make && make test)
	cp /tmp/test.img test/arch.img

check:
	pacman -Q qemu ovmf

clean:
	rm test/*.img
