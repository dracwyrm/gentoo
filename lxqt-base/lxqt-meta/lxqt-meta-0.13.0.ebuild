# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit versionator

DESCRIPTION="Meta ebuild for LXQt, the Lightweight Desktop Environment"
HOMEPAGE="http://lxqt.org/"

LICENSE="metapackage"
MY_SLOT="0/$(get_version_component_range 2)"
SLOT="${MY_SLOT}"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+about admin +filemanager lightdm lximage l10n minimal +policykit
	powermanagement sddm ssh-askpass sudo"

# Note: we prefer kde-frameworks/oxygen-icons over other icon sets, as the initial
# install expects oxygen icons, until the user specifies otherwise (bug 543380)
RDEPEND="
	kde-frameworks/oxygen-icons
	lxqt-base/lxqt-config:${MY_SLOT}
	lxqt-base/lxqt-globalkeys:${MY_SLOT}
	lxqt-base/lxqt-notificationd:${MY_SLOT}
	lxqt-base/lxqt-panel:${MY_SLOT}
	lxqt-base/lxqt-qtplugin:${MY_SLOT}
	lxqt-base/lxqt-runner:${MY_SLOT}
	lxqt-base/lxqt-session:${MY_SLOT}
	virtual/ttf-fonts
	about? ( lxqt-base/lxqt-about:${MY_SLOT} )
	admin? ( lxqt-base/lxqt-admin:${MY_SLOT} )
	filemanager? ( x11-misc/pcmanfm-qt:${MY_SLOT} )
	lightdm? ( x11-misc/lightdm )
	lximage? ( media-gfx/lximage-qt )
	l10n? ( lxqt-base/lxqt-l10n:${MY_SLOT} )
	!minimal? (
		x11-wm/openbox
		x11-misc/obconf-qt
	)
	policykit? (
		lxqt-base/lxqt-policykit:${MY_SLOT}
		|| (
			sys-auth/consolekit[policykit(-)]
			sys-apps/systemd[policykit(-)]
		)
	)
	powermanagement? ( lxqt-base/lxqt-powermanagement:${MY_SLOT} )
	sddm? ( >=x11-misc/sddm-0.11.0 )
	ssh-askpass? ( lxqt-base/lxqt-openssh-askpass:${MY_SLOT} )
	sudo? ( lxqt-base/lxqt-sudo:${MY_SLOT} )
"

S="${WORKDIR}"
