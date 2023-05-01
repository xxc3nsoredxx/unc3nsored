# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit python-single-r1

DESCRIPTION="PEDA - Python Exploit Development Assistance for GDB"
HOMEPAGE="https://github.com/longld/peda https://github.com/xxc3nsoredxx/peda"
SRC_URI="https://github.com/xxc3nsoredxx/${PN}/archive/v${PV}-gentoo.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}-gentoo"

LICENSE="CC-BY-NC-SA-3.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# The bundled version of six is 1.9.0, so using that as a minimum version
RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	')
	sys-devel/gdb[${PYTHON_SINGLE_USEDEP}]
"

src_prepare() {
	eapply_user
	rm lib/six.py
}

src_install() {
	exeinto /usr/bin
	doexe peda

	insinto /usr/lib/peda
	doins -r lib
	doins peda.py .pedainit .pedainit_no_user

	docompress -x "/usr/share/doc/${PF}/img"
	dodoc -r img
	dodoc README *.md
}

pkg_postinst() {
	elog "To have PEDA read ~/.gdbinit add the following line to ~/.pedainit"
	elog "    source ~/.gdbinit"
}
