# unc3nsored
Repo for software I find useful and don't find in the main Portage tree.

To add the repo, run:
```
eselect repository enable unc3nsored
emaint sync -r unc3nsored
```

## app-admin/
### misc-utils
A collection of miscellaneous little utils that I don't feel deserve a full repo.

Contents:
 * BTRFS snapshot management script
   - Take snapshots
   - Transfer snapshots onto a LUKS encrypted volume
 * ... more to come!
   - Still in the GitHub repo, but unpackaged

Version: 0.1.3

[GitHub][misc-utils github]

## app-misc/
### ropgadget
This tool lets you search your gadgets on your binaries to facilitate your ROP exploitation.
ROPgadget supports ELF, PE and Mach-O format on x86, x64, ARM, ARM64, PowerPC, SPARC, and MIPS architectures.

Version: 6.5

[Homepage][rop]

[GitHub][rop github]

## dev-libs/
### pico-sdk
Raspberry Pi Pico C/C++ SDK

Version: 1.3.0

[Homepage][pico sdk]

### tinyusb
TinyUSB is an open-source cross-platform USB Host/Device stack for embedded system, designed to be memory-safe with no dynamic allocation and thread-safe with all interrupt events are deferred then handled in the non-ISR task function.

NOTE: Doesn't include any of the files under hw/mcu and lib/.

Version: 0.12.0

[Homepage][tinyusb]

## dev-vcs/
### p4v
Helix Visual Client (P4V) is a desktop app that provides access to versioned files in Helix Core through a graphical interface.
It includes tools for merging and visualizing code evolution.

Version: 2022.3/2370885

[Homepage][p4v]

## net-misc/
### openssh
OpenSSH from `::gentoo` but with extra USE flag `single-config` to use a single
config file for `ssh_config` and `sshd_config` instead of fragments in
`ssh_config.d/` and `sshd_config.d/`, respectively.

Gentoo version: 9.3\_p1-r1, 9.3\_p2, 9.4\_p1-r1, 9.6\_p1 9.6\_p1-r1, 9.7\_p1-r6

## sec-keys/
### openpgp-keys-xxc3nsoredxx
OpenPGP key used by xxc3nsoredxx to sign their releases.

[Public key][pgp]

## sys-apps/
### sd
Intuitive find & replace CLI (sed alternative)

Version: 0.7.6

[Homepage][sd]

## sys-devel/
### peda
PEDA - Python Exploit Development Assistance for GDB

Version: 1.2

[Homepage (upstream)][peda]

[Homepage (Gentoo repack)][peda gentoo]

## sys-fs/
### android-simg2img
Tool to convert Android sparse images to raw images.

Since image tools are not part of Android SDK, this standalone port of AOSP libsparse aims to avoid complex building chains.

Provides:
 * `simg2img`
 * `simg2simg`
 * `img2simg`
 * `append2simg`

Version: 1.1.4

[Homepage][simg2img]


<!-- link refs -->
[misc-utils github]: https://github.com/xxc3nsoredxx/misc-utils
[rop]: https://www.shell-storm.org/project/ROPgadget/
[rop github]: https://github.com/JonathanSalwan/ROPgadget
[pico sdk]: https://github.com/raspberrypi/pico-sdk
[tinyusb]: https://github.com/hathach/tinyusb
[p4v]: https://www.perforce.com/products/helix-core-apps/helix-visual-client-p4v
[sd]: https://github.com/chmln/sd
[peda]: https://github.com/longld/peda
[peda gentoo]: https://github.com/xxc3nsoredxx/peda
[simg2img]: https://github.com/anestisb/android-simg2img

<!-- public key links will stay at the end, raw download last -->
[pgp]: https://raw.githubusercontent.com/xxc3nsoredxx/xxc3nsoredxx/master/pubkey.asc
