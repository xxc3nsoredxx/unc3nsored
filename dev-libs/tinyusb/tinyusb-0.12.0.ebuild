# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An open source cross-platform USB stack for embedded system"
HOMEPAGE="https://github.com/hathach/tinyusb"
SRC_URI="https://github.com/hathach/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# cmake triggers an RDEPEND.suspect QA warning from repoman
DEPEND="
	>=dev-util/cmake-3.13.0
"
RDEPEND="${DEPEND}"
BDEPEND=""

INSTALL_TO="/usr/share/${PN}"

src_prepare() {
	# Create the CMake package config
	cp "${FILESDIR}/tinyusb-config.cmake.template" "${S}/tinyusb-config.cmake"
	sed -i -e "s|@sdk_path@|${INSTALL_TO}|" "${S}/tinyusb-config.cmake"

	default
}

src_install() {
	insinto "${INSTALL_TO}"

	doins -r src tools

	insinto "${INSTALL_TO}/hw"

	doins -r hw/bsp

	insinto "/usr/lib/cmake/${PN}"
	doins tinyusb-config.cmake

	dodoc -r docs examples
	dodoc CODE_OF_CONDUCT.rst CONTRIBUTORS.rst README.rst

	docompress -x "/usr/share/doc/${PF}/"
}
