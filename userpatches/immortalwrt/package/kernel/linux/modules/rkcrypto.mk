RKCRYPTO_MENU:=Crypto_ROCKCHIP

define KernelPackage/crypto-hw-rockchip
  TITLE:=Rockchip crypto module
  SUBMENU:=$(RKCRYPTO_MENU)
  DEPENDS:=@TARGET_rockchip \
        +kmod-crypto-ecb \
        +kmod-crypto-cbc \
        +kmod-crypto-authenc \
        +kmod-crypto-hash \
        +kmod-crypto-des \
        +kmod-crypto-md5 \
        +kmod-crypto-sha1 \
        +kmod-crypto-sha512 \
        +kmod-crypto-sha256 \
        +kmod-crypto-engine
  KCONFIG:= \
        CONFIG_CRYPTO_SM3_GENERIC=y \
        CONFIG_CRYPTO_HW=y \
        CONFIG_CRYPTO_DEV_ROCKCHIP \
        CONFIG_CRYPTO_DEV_ROCKCHIP_DEBUG=y \
        CONFIG_CRYPTO_DEV_ROCKCHIP2 \
        CONFIG_CRYPTO_DEV_ROCKCHIP2_DEBUG=y \
        CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n \
        CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=n
  FILES:=$(LINUX_DIR)/drivers/crypto/rockchip/rk_crypto.ko \
		$(LINUX_DIR)/drivers/crypto/rockchip/rk_crypto2.ko
  AUTOLOAD:=$(call AutoLoad,09,rk_crypto rk_crypto2)
endef

define KernelPackage/crypto-hw-rockchip/description
Kernel module to enable Rockchip Crypto and Crypto2
endef

$(eval $(call KernelPackage,crypto-hw-rockchip))