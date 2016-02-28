NAME           = sdsc-blcr
VERSION        = 0.8.5
RELEASE        = 2
PKGROOT        = /opt/blcr/$(VERSION)

SRC_SUBDIR     = blcr

SOURCE_NAME    = blcr
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
