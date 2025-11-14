# Android 16 for HTC U11 Ultra (Ocean)

Android 16 device tree for HTC U11 Ultra (codename: ocean)

## Device Specifications

| Feature | Specification |
| ------- | ------------- |
| Chipset | Qualcomm MSM8998 Snapdragon 835 |
| CPU | Octa-core (4x2.45 GHz Kryo & 4x1.9 GHz Kryo) |
| GPU | Adreno 540 |
| Memory | 6 GB RAM |
| Storage | 128 GB (UFS 2.1) |
| Display | 6.0" QHD+ (1440 x 2880 pixels) Super LCD 5 |
| Camera (Rear) | Dual: 12 MP (f/1.7, 1/2.55", 1.4µm, PDAF, OIS) + 16 MP |
| Camera (Front) | 16 MP (f/2.0, 1/3.06", 1.0µm) |
| Battery | 3930 mAh (non-removable) |
| Dimensions | 164.1 x 79.8 x 9.2 mm |
| Weight | 188 g |
| Connectivity | Wi-Fi 802.11 a/b/g/n/ac, Bluetooth 5.0, GPS, NFC |

## Device Tree Structure

```
And16/
├── device/htc/ocean/          # Device tree
├── kernel/htc/msm8998/        # Kernel source
└── vendor/htc/ocean/          # Proprietary vendor files
```

## Building Android 16

### Prerequisites

- Ubuntu 20.04 LTS or newer (or compatible Linux distribution)
- At least 300GB of free disk space
- At least 16GB of RAM (32GB recommended)
- Fast internet connection

### Setting Up Build Environment

1. Install required packages:
```bash
sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-11-jdk python3 python-is-python3
```

2. Install repo tool:
```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH
```

3. Configure git:
```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### Downloading Source Code

1. Initialize the Android 16 repository:
```bash
mkdir ~/android16
cd ~/android16
repo init -u https://android.googlesource.com/platform/manifest -b android-16.0.0_r1
```

2. Sync the repository (this will take several hours):
```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### Adding Device Files

1. Clone this repository into your Android source tree:
```bash
cd ~/android16
git clone https://github.com/YOUR_USERNAME/And16.git temp_clone
cp -r temp_clone/device/htc/ocean device/htc/
cp -r temp_clone/kernel/htc/msm8998 kernel/htc/
cp -r temp_clone/vendor/htc/ocean vendor/htc/
rm -rf temp_clone
```

2. Clone the LineageOS/Android common dependencies:
```bash
# Clone common Qualcomm HALs and dependencies
git clone https://github.com/LineageOS/android_hardware_qcom_audio hardware/qcom/audio
git clone https://github.com/LineageOS/android_hardware_qcom_display hardware/qcom/display
git clone https://github.com/LineageOS/android_hardware_qcom_media hardware/qcom/media
```

### Extracting Proprietary Files

You need to extract proprietary files from your device or from a stock ROM.

#### Option 1: Extract from device (requires rooted device with ADB)
```bash
cd device/htc/ocean
./extract-files.sh
```

#### Option 2: Extract from stock ROM
```bash
cd device/htc/ocean
./extract-files.sh /path/to/stock/rom/system
```

### Building the ROM

1. Set up the build environment:
```bash
cd ~/android16
source build/envsetup.sh
```

2. Choose your build target:
```bash
lunch lineage_ocean-userdebug
```

3. Start the build (this will take 2-6 hours depending on your hardware):
```bash
mka bacon -j$(nproc --all)
```

The compiled ROM will be located in:
`out/target/product/ocean/lineage-16.0-*-ocean.zip`

### Building Options

- **User build** (production): `lunch lineage_ocean-user`
- **Userdebug build** (recommended for development): `lunch lineage_ocean-userdebug`
- **Engineering build** (development with root): `lunch lineage_ocean-eng`

## Installing the ROM

### Prerequisites
- Unlocked bootloader
- Custom recovery installed (TWRP recommended)
- Backup of your current ROM

### Installation Steps

1. Download the built ROM zip file to your device
2. Boot into recovery mode
3. Wipe: System, Data, Cache, Dalvik/ART Cache
4. Install the ROM zip file
5. Install GApps (optional)
6. Reboot system

## Known Issues

- Initial release may have bugs
- Camera features may be limited
- VoLTE/VoWiFi may not work
- Some proprietary features from stock ROM may not work

## Credits

- LineageOS team for the base ROM and device tree examples
- HTC for the device
- All contributors to this project

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues.

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.

## Disclaimer

This ROM is provided as-is without any warranty. The developers are not responsible for any damage to your device. Use at your own risk.

## Support

For issues and questions:
- Open an issue on GitHub
- Join our Telegram group (if available)
- Check XDA Developers forum

## Additional Resources

- [Android Building Guide](https://source.android.com/setup/build/building)
- [LineageOS Wiki](https://wiki.lineageos.org/)
- [XDA Developers](https://forum.xda-developers.com/)
