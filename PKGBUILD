# Maintainer: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=rtl8187se
_modname=r8187se
pkgver=3.15
pkgrel=1
pkgdesc="Realtek PCI Express wireless driver for use in newer kernels"
arch=('i686' 'x86_64')
url="https://github.com/freestyl3r/rtl8187se"
license=('GPL2')
makedepends=('linux-headers')
provides=('r8187se')
source=("https://github.com/freestyl3r/rtl8187se/archives/3.15.tar.gz"
		"$pkgname.install")
install=$pkgname.install
md5sums=('')

build() {
	cd $_modname
	make
}

package() {
	cd $_modname
	install -m644 $_modname.ko "$pkgdir/lib/modules/`uname -r`/extramodules/$_modname.ko"
	gzip "$pkgdir/lib/modules/`uname -r`/extramodules/$_modname.ko"
}
