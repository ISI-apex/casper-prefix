# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Scalar-List-Utils/Scalar-List-Utils-1.19.ebuild,v 1.9 2007/08/12 20:20:34 tgall Exp $

EAPI="prefix"

inherit perl-module

DESCRIPTION="Scalar-List-Utils module for perl"
HOMEPAGE="http://cpan.org/modules/by-module/Scalar/"
SRC_URI="mirror://cpan/authors/id/G/GB/GBARR/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc-macos ~x86 ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="dev-lang/perl"
