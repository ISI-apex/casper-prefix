# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXaw/libXaw-1.0.4.ebuild,v 1.10 2009/10/26 19:32:45 grobian Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular flag-o-matic autotools

DESCRIPTION="X.Org Xaw library"

KEYWORDS="~ppc-aix ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="xprint"

RDEPEND="x11-libs/libX11
	x11-libs/libXt
	x11-libs/libXmu
	x11-libs/libXpm
	x11-proto/xproto
	xprint? ( x11-libs/libXp )"
DEPEND="${RDEPEND}
	sys-apps/ed"

pkg_setup() {
	CONFIGURE_OPTIONS="$(use_enable xprint xaw8)"

	# No such function yet
	# x-modular_pkg_setup

	# (#125465) Broken with Bdirect support
	filter-flags -Wl,-Bdirect
	filter-ldflags -Bdirect
	filter-ldflags -Wl,-Bdirect
}

src_unpack() {
	PATCHES=(
		"${FILESDIR}"/${PN}-1.0.3-darwin.patch
	)
	x-modular_src_unpack
	eautoreconf # eautoreconf gets ran by the eclass only if SNAPSHOT="yes", so
				# we need it for prefix.
}
