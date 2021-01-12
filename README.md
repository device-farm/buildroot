# Buildroot fork for DEVICE.FARM

This is a fork of `buildroot` with support for DEVICE.FARM. Check also original [README](README).

## Stock images

DEVICE.FARM builds stock images for boards declared in df.json files. The build process scans whole `boards` directory for df.json files. The file df.json is an array of devices relevant for current directory, e.g.:

```json
[
    {
        "name": "Orange Pi Zero",
        "maker": "Xunlong",
        "picture": "orangepi-zero.jpg",
        "defconfig": "df_orangepi_zero_defconfig"
    }
]
```

- `name` is a board name as it appears on the web site
- `maker` is a board maker name as it appears on the web site
- `picture` is board photo to be displayed on the website; path is relative to df.json directory
- `defconfig` is `make` target to select default configuration for the board

## defconfig

By convention, there is a modified defconfig for each DEVICE.FARM supported device prefixed with `df_`. 
To create a new defconfig:
1. load original defconfig e.g. `make orangepi_zero_defconfig`
1. run `make menuconfig`
1. add `df_` prefix to `BR2_DEFCONFIG` (Build options/Location to save buildroot config)
1. change C library to `musl` i.e. select BR2_TOOLCHAIN_BUILDROOT_MUSL (Toolchain/C library)
1. change root size to `200` in `BR2_TARGET_ROOTFS_EXT2_SIZE` (Filesystem images/exact size)
1. select DEVICE.FARM support package `BR2_PACKAGE_DEVICE_FARM` (Target packages/Networking applications/device.farm connected device)
1. exit menuconfig
1. save new defconfig by `make savedefconfig`

## TODO
- fscheck on start
  - if not swap, create 1G swap, use
  - if not mounted /data, create partition, mount
- wifi conf on start (if wpa_supplicant installed)
  - start wpa_supplicant 
- wg to start without network (DNS resolve issue, WG_ENDPOINT_RESOLUTION_RETRIES)
- uboot disable USB
