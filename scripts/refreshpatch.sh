#!/bin/bash
# 生成series并依次push和refresh
export OP_DIR=`pwd`
export QUILT_PATCHES=~/Actions-OpenWrt-NSY/userpatches/openwrt/target/linux/rockchip/patches-6.6
export APPLY_DIR=$OP_DIR/build_dir/target-aarch64_generic_musl/linux-rockchip_armv8/linux-6.6.119

export QUILT_DIFF_ARGS="--no-timestamps --no-index -p ab --color=auto"
export QUILT_REFRESH_ARGS="--no-timestamps --no-index -p ab"
export QUILT_SERIES_ARGS="--color=auto"
export QUILT_PATCH_OPTS="--unified"
export QUILT_DIFF_OPTS="-p"
export EDITOR="vim"
cd "${QUILT_PATCHES}"
rm -rf series
ls *.patch > series
cd "${OP_DIR}"
git restore target/linux/rockchip/patches-6.6
make target/linux/{clean,prepare}

cd "${APPLY_DIR}"
#quilt pop -a && \
for patch in $(cat "${QUILT_PATCHES}/series"); do \
    echo "处理: $patch"; \
    quilt push && quilt refresh; \
done

rm -rf ${QUILT_PATCHES}/series