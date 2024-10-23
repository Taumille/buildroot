################################################################################
#
# sophgo-fiptool
#
################################################################################

HOST_SOPHGO_FIPTOOL_DEPENDENCIES = opensbi uboot

SOPHGO_FIPTOOL_VERSION = 7fb26aa36f75dbea331b74f2857af864f187d800
SOPHGO_FIPTOOL_SITE = https://github.com/sophgo/fiptool
SOPHGO_FIPTOOL_SITE_METHOD = git
SOPHGO_FIPTOOL_GIT_SUBMODULES = YES
SOPHGO_FIPTOOL_LICENSE = BSD-2-Clause
SOPHGO_FIPTOOL_FILES = LICENSE

ifeq ($(BR2_PACKAGE_HOST_SOPHGO_FIPTOOL_CV180X),y)
	SOPHGO_FIPTOOL_FSBL = cv180x.bin
endif
ifeq ($(BR2_PACKAGE_HOST_SOPHGO_FIPTOOL_CV181X),y)
	SOPHGO_FIPTOOL_FSBL = cv181x.bin
endif

define HOST_SOPHGO_FIPTOOL_BUILD_CMDS
	$(@D)/fiptool \
		--fsbl $(@D)/data/fsbl/$(SOPHGO_FIPTOOL_FSBL) \
		--ddr_param $(@D)/data/ddr_param.bin \
		--rtos $(@D)/data/cvirtos.bin \
		--opensbi $(BINARIES_DIR)/fw_dynamic.bin \
		--uboot $(BINARIES_DIR)/u-boot.bin \
		$(@D)/fip.bin
endef

define HOST_SOPHGO_FIPTOOL_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/fip.bin $(BINARIES_DIR)/fip.bin
endef

$(eval $(host-generic-package))
