# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV_YEAR=$(ver_cut 1)
# Strip the first two digits of the year
MY_PV_YEAR="${MY_PV_YEAR:2}"
MY_PV_REL=$(ver_cut 2)

DESCRIPTION="Helix Visual Client (P4V) For Helix Core"
HOMEPAGE="https://www.perforce.com/products/helix-core-apps/helix-visual-client-p4v"
SRC_URI="
	https://filehost.perforce.com/perforce/r${MY_PV_YEAR}.${MY_PV_REL}/bin.linux26x86_64/${PN}.tgz -> ${P}.tar.gz
	https://filehost.perforce.com/perforce/r${MY_PV_YEAR}.${MY_PV_REL}/doc/user/p4vnotes.txt -> p4vnotes-${PV}.txt
"

LICENSE="p4v-20241024"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="bindist mirror"

RDEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util-cursor
"

INSTALL_TO="/opt/p4v"

src_install() {
	exeinto "${INSTALL_TO}/bin"

	for bin in $(ls bin/*); do
		doexe "${bin}"
	done

	insinto "${INSTALL_TO}"

	doins -r lib

	# Symlink all the runner scripts into /usr/bin
	local targets=(
		"p4admin"
		"p4merge"
		"p4v"
		"p4vc"
	)
	for t in "${targets[@]}"; do
		dosym "../../${INSTALL_TO#/}/bin/${t}" "/usr/bin/${t}"
	done

	newdoc "${DISTDIR}/p4vnotes-${PV}.txt" p4vnotes.txt
}

pkg_postinst() {
	ewarn "Perforce only provides the latest patch revisions. The SRC_URI may contain"
	ewarn "files that no longer match the hashes in the Manifest when installing"
	ewarn "another time!"
}
