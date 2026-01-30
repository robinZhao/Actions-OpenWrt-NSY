NETWORK_DEVICES_MENU:=Network Devices

define KernelPackage/dsa-realtek
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  TITLE:=Realtek common module RTL83xx DSA switch family
  DEPENDS:=+kmod-dsa +kmod-phy-realtek +kmod-regmap-core +kmod-dsa-rtl8366rb +kmod-dsa-rtl8365mb @!TARGET_x86 @!TARGET_bcm47xx @!TARGET_uml
  KCONFIG:= \
	CONFIG_NET_DSA_REALTEK=y \
	CONFIG_NET_DSA_REALTEK_MDIO \
	CONFIG_NET_DSA_REALTEK_SMI
  FILES:= \
  $(LINUX_DIR)/drivers/net/dsa/realtek/realtek-mdio.ko \
  $(LINUX_DIR)/drivers/net/dsa/realtek/realtek-smi.ko 
  AUTOLOAD:=$(call AutoLoad,43,realtek-mdio realtek-smi,1)
endef

define KernelPackage/dsa-realtek/description
  Common kernel module for Realtek RTL83xx DSA switch family
endef

$(eval $(call KernelPackage,dsa-realtek))


define KernelPackage/dsa-rtl8366rb
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  TITLE:=Realtek RTL8366RB switch DSA support
  DEPENDS:=@!TARGET_x86 @!TARGET_bcm47xx @!TARGET_uml
  KCONFIG:= \
	CONFIG_NET_DSA_REALTEK_RTL8366RB \
	CONFIG_NET_DSA_REALTEK_RTL8366RB_LEDS=y \
	CONFIG_NET_DSA_TAG_RTL4_A
  FILES:= \
	$(LINUX_DIR)/drivers/net/dsa/realtek/rtl8366.ko \
	$(LINUX_DIR)/net/dsa/tag_rtl4_a.ko
  AUTOLOAD:=$(call AutoLoad,42,rtl8366,1)
endef

define KernelPackage/dsa-rtl8366rb/description
  DSA based kernel modules for the Realtek RTL8366RB switch family
endef

$(eval $(call KernelPackage,dsa-rtl8366rb))


define KernelPackage/dsa-rtl8365mb
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  TITLE:=Realtek RTL8365MB switch DSA support
  DEPENDS:=@!TARGET_x86 @!TARGET_bcm47xx @!TARGET_uml
  KCONFIG:= \
	CONFIG_NET_DSA_REALTEK_RTL8365MB \
	CONFIG_NET_DSA_TAG_RTL8_4
  FILES:= \
	$(LINUX_DIR)/drivers/net/dsa/realtek/rtl8365mb.ko \
	$(LINUX_DIR)/net/dsa/tag_rtl8_4.ko
  AUTOLOAD:=$(call AutoLoad,42,rtl8365mb,1)
endef

define KernelPackage/dsa-rtl8365mb/description
  DSA based kernel modules for the Realtek RTL8365MB switch family
endef

$(eval $(call KernelPackage,dsa-rtl8365mb))