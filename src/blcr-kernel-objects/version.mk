KERNEL         := $(shell uname -r)

NAME           = sdsc-blcr-kernel-objects
VERSION        = $(firstword $(subst -, ,$(KERNEL)))
RELEASE        = $(lastword $(subst -, ,$(KERNEL)))
PKGROOT        = /

RPM.EXTRAS     = AutoReq:No\nObsoletes: sdsc-blcr-rc
