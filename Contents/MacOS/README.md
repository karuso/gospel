# MacOS

DNS Flush
```bash
# sudo killall -HUP mDNSResponder
```

## Create Fusion Drive

» sudo su


1. Create Bootable OSX on USB external drive (NO NAME)
(change name accordingly with system version)
```bash
# /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/NO\ NAME/ --applicationpath /Applications/Install\ OS\ X\ El\ Capitanapp
```

2. Start Mac from USB (press option at startup)

3. From Menu Utility > Terminal
```bash
# diskutil list
```
Take note of drives to fuse (generally 0 and 1)
```bash
# diskutil coreStorage create myLogicalVolGroup /dev/disk0 /dev/disk1
```
4. Copy Core Storage LVG UUID (ie EF90FE16-4892-4147-B540-8FDC537792D2)

5. Create Fusion drive
```bash
# diskutil coreStorage createVolume EF90FE16-4892-4147-B540-8FDC537792D2 jhfs+ "Macintosh HD" 100%
```

## Create Ubuntu Bootable USB pen

1. Download Ubuntu from site

2. Convert iso to img
```bash
# hdiutil convert -format UDRW -o ~/path/to/target ~/path/to/ubuntu.iso
```

3. Discover USB node (take note of /dev/diskN)
```bash
# diskutil list
```
(try with and without pen if not clear)


4. Eject USB pen
```bash
# diskutil unmountDisk /dev/diskN
```

5. Create bootable
```bash
# sudo dd if=/path/to/path_to_dmg of=/dev/rdiskN bs=1m
```
NB "r" in rdiskN is not a typo and N comes from step 2
(if then a finder window shuold appear, do nothing until next step and then press Ignore)

6. Eject USB pen
```bash
# diskutil eject /dev/diskN
```

## Speed Up a Slow Terminal by Clearing Log Files

Remove *.asl file
```bash
# sudo rm -rf /private/var/log/asl/*.asl
```







Back to the [Table of Contents](https://github.com/karuso/gospel#table-of-contents)