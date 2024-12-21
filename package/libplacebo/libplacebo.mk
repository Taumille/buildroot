################################################################################
#
# vlc
#
################################################################################

LIBPLACEBO_VERSION = 7.349.0
LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo/-/archive/v$(LIBPLACEBO_VERSION)
LIBPLACEBO_SOURCE = libplacebo-v$(LIBPLACEBO_VERSION).tar.gz
LIBPLACEBO_LICENSE = GPL-2.0+, LGPL-2.1+
LIBPLACEBO_LICENSE_FILES = LICENSE
LIBPLACEBO_CPE_ID_VENDOR = libplacebo
LIBPLACEBO_INSTALL_STAGING = YES
LIBPLACEBO_DEPENDENCIES += host-python-glad2 \
			   host-python-glslang \
			   host-python-jinja2 \
			   lcms2 \
			   vulkan-headers

$(eval $(meson-package))
