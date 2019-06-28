# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="5"
inherit udev
DESCRIPTION="drivers, config files for rpi3"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    chromeos-base/rpi-boot-bin
    chromeos-base/auto-expand-partition
"

DEPEND="${RDEPEND}"
S=${WORKDIR}

src_install() {
  udev_dorules "${FILESDIR}/udev/10-vchiq-permissions.rules"
  udev_dorules "${FILESDIR}/udev/99-rpi3-restart-ui-after-hdmi-connetced.rules"
  exeinto /lib/udev
  doexe "${FILESDIR}/udev/restart_ui.sh"
  insinto /lib
  doins -r "${FILESDIR}/firmware"
  insinto /etc/init
  doins "${FILESDIR}/bt/bluetooth_uart.conf"
  doins "${FILESDIR}/bt/console-ttyAMA0.override"
  doins "${FILESDIR}/audio/force_audio_output_to_headphones.conf"
  insinto /firmware/rpi
  doins "${FILESDIR}/kernel-config"/*.txt"
}
