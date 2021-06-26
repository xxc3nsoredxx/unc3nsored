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

Version: 0.1.1

[GitHub][misc-utils github]

## app-misc/
### ropgadget
This tool lets you search your gadgets on your binaries to facilitate your ROP exploitation.
ROPgadget supports ELF, PE and Mach-O format on x86, x64, ARM, ARM64, PowerPC, SPARC, and MIPS architectures.

Version: 6.5

[Homepage][rop]

[GitHub][rop github]

## sys-apps/
### sd
Intuitive find & replace CLI (sed alternative)

Version: 0.7.6

[Homepage][sd]

## sys-devel/
### peda
PEDA - Python Exploit Development Assistance for GDB

Version: 1.1_p20200102

Latest upstream commit included: 84d38bda

[Homepage (upstream)][peda]

[Homepage (Gentoo repack)][peda gentoo]


<!-- link refs -->
[misc-utils github]: https://github.com/xxc3nsoredxx/misc-utils
[rop]: https://www.shell-storm.org/project/ROPgadget/
[rop github]: https://github.com/JonathanSalwan/ROPgadget
[sd]: https://github.com/chmln/sd
[peda]: https://github.com/longld/peda
[peda gentoo]: https://github.com/xxc3nsoredxx/peda
