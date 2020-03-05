SHELL := /bin/bash
DEFAULT_GOAL := test_arch

.PHONY: test_arch
test_arch: check start

test/test_arch.img.tmp: test/arch.img
	cp test/arch.img test/test_arch.img.tmp

test/arch.img:
	[[ -f /data/archiso/test.img ]] || (cd /data/archiso && make clean && make && make test)
	cp /data/archiso/test.img test/arch.img

.PHONY: check
check:
	pacman -Q qemu ovmf

clean:
	rm -f test/*.img

.PHONY: start
start: check test/test_arch.img.tmp
	qemu-system-x86_64 \
		-bios /usr/share/ovmf/x64/OVMF_CODE.fd \
		-m 4G \
		-enable-kvm \
		-smp cores=$$(nproc) \
		-drive file=test/test_arch.img.tmp,format=raw
