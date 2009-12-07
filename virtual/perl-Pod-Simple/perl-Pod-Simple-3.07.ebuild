# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-Pod-Simple/perl-Pod-Simple-3.07.ebuild,v 1.5 2009/12/04 13:29:23 tove Exp $

DESCRIPTION="framework for parsing Pod"
HOMEPAGE="http://www.gentoo.org/proj/en/perl/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"

IUSE=""
DEPEND=""

RDEPEND="|| ( ~dev-lang/perl-5.10.1 ~perl-core/Pod-Simple-${PV} )"
