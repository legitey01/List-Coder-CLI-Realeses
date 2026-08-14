# Maintainer: ListCoder Team <support@list-coder.com>
pkgname=listcoder-bin
pkgver=0.1.11
pkgrel=1
pkgdesc='AI-powered development tool'
arch=('x86_64' 'aarch64')
url='https://github.com/legitey01/List-Coder-CLI-Realeses'
license=('MIT')
depends=('glibc')
provides=('listcoder')
conflicts=('listcoder')

source_x86_64=("https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v${pkgver}/listcoder-x86_64-unknown-linux-gnu")
source_aarch64=("https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v${pkgver}/listcoder-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/listcoder" "${pkgdir}/usr/bin/listcoder"
}
