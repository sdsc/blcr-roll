NAME        = blcr-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/applications/blcr

VERSION_SRC = $(REDHAT.ROOT)/src/blcr/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
