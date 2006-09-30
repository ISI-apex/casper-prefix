# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/tar/tar-1.15.91.ebuild,v 1.1 2006/07/03 19:40:47 vapier Exp $

EAPI="prefix"

inherit flag-o-matic eutils

DESCRIPTION="Use this to make tarballs :)"
HOMEPAGE="http://www.gnu.org/software/tar/"
SRC_URI="http://ftp.gnu.org/gnu/tar/${P}.tar.bz2
	ftp://alpha.gnu.org/gnu/tar/${P}.tar.bz2
	mirror://gnu/tar/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc-macos ~x86 ~x86-macos"
IUSE="nls static build bzip2"

RDEPEND="app-arch/gzip
	bzip2? ( app-arch/bzip2 )"
DEPEND="${RDEPEND}
	nls? ( >=sys-devel/gettext-0.10.35 )"

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/${P}-darwin.patch
	cd "${S}"
	if [[ ${USERLAND} != "GNU" ]] && [[ ${EPREFIX%/} == "" ]] ; then
		sed -i \
			-e 's:/backup\.sh:/gbackup.sh:' \
			scripts/{backup,dump-remind,restore}.in \
			|| die "sed non-GNU"
	fi
}

src_compile() {
	local myconf
	use static && append-ldflags -static
	[[ ${USERLAND} != "GNU" ]] && [[ ${EPREFIX%/} == "" ]] && \
		myconf="--program-prefix=g"
	# Work around bug in sandbox #67051
	gl_cv_func_chown_follows_symlink=yes \
	econf \
		--enable-backup-scripts \
		$(with_bindir) \
		--libexecdir=${EPREFIX}/usr/sbin \
		$(use_enable nls) \
		${myconf} || die
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${EDEST}" install || die "make install failed"
	# a nasty yet required symlink
	local p=""
	use userland_BSD && p=g
	dodir /etc
	dosym /usr/sbin/${p}rmt /etc/${p}rmt
	if use build ; then
		rm -r "${D}"/usr
	else
		dodir /usr/bin
		dosym /bin/${p}tar /usr/bin/${p}tar
		dodoc AUTHORS ChangeLog* NEWS README* PORTS THANKS
		newman "${FILESDIR}"/tar.1 ${p}tar.1
		mv "${D}"/usr/sbin/${p}backup{,-tar}
		mv "${D}"/usr/sbin/${p}restore{,-tar}
	fi

	rm -f ${D}/usr/$(get_libdir)/charset.alias
}
