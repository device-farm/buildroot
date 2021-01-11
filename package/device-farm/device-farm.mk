DEVICE_FARM_VERSION = 1.0
DEVICE_FARM_SITE = https://www.device.farm
DEVICE_FARM_LICENSE = GPL-2.0
DEVICE_FARM_LICENSE_FILES = COPYING

define DEVICE_FARM_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
endef

define DEVICE_FARM_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/default
	$(INSTALL) -D -m 0644 $(DEVICE_FARM_PKGDIR)/etc-default-dockerd $(TARGET_DIR)/etc/default/dockerd
	$(INSTALL) -D -m 0744 $(DEVICE_FARM_PKGDIR)/etc-init.d-S50df-wireguard $(TARGET_DIR)/etc/init.d/S50df-wireguard

	#TODO make this optional, the block bellow does not work
	$(INSTALL) -D -m 0744 $(DEVICE_FARM_PKGDIR)/etc-init.d-S45df-wifi $(TARGET_DIR)/etc/init.d/S45df-wifi
endef

#ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
#define DEVICE_FARM_INSTALL_WIFI
#	$(INSTALL) -D -m 0744 $(DEVICE_FARM_PKGDIR)/etc-init.d-S45df-wifi $(TARGET_DIR)/etc/init.d/S45df-wifi
#endef
#DEVICE_FARM_INSTALL_TARGET_CMDS += DEVICE_FARM_INSTALL_WIFI
#endif

$(eval $(virtual-package))
