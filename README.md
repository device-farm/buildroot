#Buildroot fork for DEVICE.FARM


##Stock images

DEVICE.FARM builds stock (ready to use) images for boards declared in df.json file
located in boards directory. The manifest file df.json is an array of devices relevant 
for current directory, e.g.:

[
    {
        "name": "Orange Pi Zero",
        "defconfig": "df_orangepi_zero_defconfig",
        "picture": "orangepi-zero.jpg",
        "maker": "Xunlong"
    }
]

By convention, there is a modified defconfig for each DEVICE.FARM supported device. 
To create a new defconfig:
- load original defconfig 