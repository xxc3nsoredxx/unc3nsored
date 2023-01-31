# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenPGP key used by xxc3nsoredxx to sign their releases"
HOMEPAGE="https://github.com/xxc3nsoredxx"
SRC_URI="https://raw.githubusercontent.com/xxc3nsoredxx/xxc3nsoredxx/master/pubkey.asc -> ${P}.asc"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

src_install() {
	local files=( ${A} )
	insinto /usr/share/openpgp-keys
	newins - xxc3nsoredxx.asc < <(cat "${files[@]/#/${DISTDIR}/}" || die)
}
