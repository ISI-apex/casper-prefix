# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/deb2targz/deb2targz-1.ebuild,v 1.5 2007/02/24 16:17:12 ticho Exp $

EAPI="prefix"

DESCRIPTION="Convert a .deb file to a .tar.gz archive"
HOMEPAGE="http://www.miketaylor.org.uk/tech/deb/"
SRC_URI="http://www.miketaylor.org.uk/tech/deb/${PN}"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc-macos ~x86"
IUSE=""

DEPEND="virtual/libc"
RDEPEND="${DEPEND}
	dev-lang/perl"

S=${WORKDIR}

src_unpack() {
	cp ${DISTDIR}/${PN} ${S}
}

src_install() {
	dobin ${PN}
}
