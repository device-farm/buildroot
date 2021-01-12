DEVICE_FARM_VERSION = 1.0
DEVICE_FARM_SITE = https://www.device.farm
DEVICE_FARM_LICENSE = GPL-2.0
DEVICE_FARM_LICENSE_FILES = COPYING

define DEVICE_FARM_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
endef

define DEVICE_FARM_INSTALL_TARGET_CMDS
	$(call SYSTEM_RSYNC,$(DEVICE_FARM_PKGDIR)/install,$(TARGET_DIR))
endef

$(eval $(virtual-package))
