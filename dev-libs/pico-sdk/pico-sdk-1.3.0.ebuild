# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Raspberry Pi Pico C/C++ SDK"
HOMEPAGE="https://github.com/raspberrypi/pico-sdk"
SRC_URI="https://github.com/raspberrypi/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# cmake triggers an RDEPEND.suspect QA warning from repoman
DEPEND="
	>=dev-util/cmake-3.13.0
"
RDEPEND="${DEPEND}"
BDEPEND=""

# TODO: TinyUSB USE flag to replace git submodule

INSTALL_TO="/usr/share/${PN}"

src_prepare() {
	# Create the CMake package config
	cp "${FILESDIR}/pico-sdk-config.cmake.template" "${S}/pico-sdk-config.cmake"
	sed -i -e "s|@sdk_path@|${INSTALL_TO}|" "${S}/pico-sdk-config.cmake"

	eapply_user
}

src_install() {
	insinto "${INSTALL_TO}"
	keepdir "${INSTALL_TO}/lib/tinyusb"

	# Copy directories
	doins -r {cmake,docs,external,src,test,tools}

	# Copy files
	doins {CMakeLists.txt,pico_sdk_init.cmake,pico_sdk_version.cmake}

	# Copy the CMake package config
	insinto "/usr/lib/cmake/${PN}"
	doins pico-sdk-config.cmake

	dodoc CONTRIBUTING.md README.md
}

pkg_postinst() {
	elog "The Raspberry Pi Pico SDK requires an 'arm-none-eabi' toolchain to be"
	elog "useful. See https://wiki.gentoo.org/wiki/Crossdev for a tool that let's you"
	elog "build a GCC cross-compiler for various different architectures."
}
