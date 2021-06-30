# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig udev verify-sig

DESCRIPTION="Collection of miscellaneous little utils that I don't feel deserve a full repo."
HOMEPAGE="https://github.com/xxc3nsoredxx/misc-utils"
SRC_URI="https://github.com/xxc3nsoredxx/${PN}/releases/download/${PV}/${P}.tar.gz
	verify-sig? ( https://github.com/xxc3nsoredxx/${PN}/releases/download/${PV}/${P}.tar.gz.asc )
"
VERIFY_SIG_OPENPGP_KEY_PATH="/usr/share/openpgp-keys/xxc3nsoredxx.asc"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="snapshots"
# No point in building if nothing is selected for install...
REQUIRED_USE="
	|| (
		snapshots
	)
"

DEPEND="
	snapshots? (
		sys-fs/btrfs-progs
		virtual/udev
		sys-fs/cryptsetup
	)
"
RDEPEND="${DEPEND}"
BDEPEND="${RDEPEND}
	verify-sig? ( app-crypt/openpgp-keys-xxc3nsoredxx )
"

src_prepare() {
	default

	use snapshots && restore_config snapshots/snapshots.conf
}

src_configure() {
	# Remove .sh suffix from bash scripts
	# Get the system udev rules directory
	econf \
		--program-transform-name='s/.sh$//' \
		--with-udevdir="$(get_udevdir)/rules.d" \
		$(use_enable snapshots)
}

src_install() {
	default

	use snapshots && save_config snapshots/snapshots.conf
}

pkg_postinst() {
	if ! use savedconfig; then
		ewarn "The default config files are likely not going to be usable. It is therefore"
		ewarn "recommended to install with USE=savedconfig to be able to provide your own,"
		ewarn "working config files."
	fi
}
