# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="4"

DESCRIPTION="Generic ebuild which satisifies virtual/chromeos-bsp.
This is a direct dependency of virtual/target-chromium-os, but is expected
to be overridden in an overlay for each specialized board.  A typical
non-generic implementation will install any board-specific configuration
files and drivers which are not suitable for inclusion in a generic board
overlay."
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    !chromeos-base/chromeos-bsp-null
	sys-kernel/linux-firmware
    www-plugins/chrome-binary-plugins
    media-libs/libvpx
	media-libs/x264
    media-libs/mesa
    media-libs/minigbm
   "

DEPEND="${RDEPEND}"