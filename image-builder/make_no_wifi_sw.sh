make image PROFILE=nsy_g68-plus PACKAGES="kmod-switch-rtl8367b swconfig \
-kmod-dsa -kmod-phy-realtek -kmod-dsa-realtek -kmod-dsa-rtl8365mb \
kmod-button-hotplug kmod-leds-gpio \
kmod-fs-vfat kmod-fs-ntfs3 kmod-fs-ext4 kmod-fs-exfat \
luci luci-ssl-openssl luci-compat luci-i18n-base-zh-cn \
luci-i18n-firewall-zh-cn luci-app-samba4 luci-i18n-samba4-zh-cn luci-app-upnp \
luci-i18n-upnp-zh-cn luci-app-https-dns-proxy luci-i18n-https-dns-proxy-zh-cn \
luci-app-adblock luci-i18n-adblock-zh-cn luci-app-wol luci-i18n-wol-zh-cn kmod-tun \
zerotier tcpdump block-mount ca-certificates \
kmod-crypto-hw-rockchip libopenssl-afalg openssl-util \
kmod-oaf luci-app-oaf luci-i18n-oaf-zh-cn openssh-sftp-server -libustream-mbedtls libustream-openssl20201210 -apk-mbedtls apk-openssl \
" \
FILES=sw \
EXTRA_IMAGE_NAME=sw_no_wifi