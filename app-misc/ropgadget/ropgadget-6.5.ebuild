# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

# Upstream uses capital letters in the package name
MY_PN="ROPgadget"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

# Slightly reworded from upstream to fix grammar and get length <80
DESCRIPTION="Search for gadgets in your binaries to facilitate your ROP exploitation."
HOMEPAGE="https://www.shell-storm.org/project/ROPgadget/
	https://github.com/JonathanSalwan/ROPgadget"
SRC_URI="https://github.com/JonathanSalwan/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-libs/capstone[python,${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="${RDEPEND}"

DOCS="AUTHORS README.md"

python_src_prepare() {
	distutils-r1_python_src_prepare

	python_fix_shebang ropgadget scripts ROPgadget.py setup.py
	sed -i -e 's/python[23]/${EPYTHON}/' test-suite-binaries/test.sh
}

python_test() {
	cd test-suite-binaries
	./test.sh || die "Test with ${EPYTHON} failed!"
}
