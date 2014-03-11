NAME               = blcr
VERSION            = 0.8.5
RELEASE            = 0
PKGROOT            = /opt/blcr/$(VERSION)
RPM.EXTRAS         = AutoReq:No

SRC_SUBDIR         = blcr

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
