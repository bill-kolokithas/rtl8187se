# The driver

rtl8187se chipsets (that's the PCI express version), used the `r8187se` kernel module up till the **3.14** kernel.  
From linux kernel version **3.15** and up, `r8187se` is [removed](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5ed0a8e667090003fdf7b750296fcfb248349502) and `rtl8180` module [gained support](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9d2ffb81608da30c3293fb7e20474358a5951cca) for the `r8187se` chipsets.

## The problem

So far so good, except that the `rtl8180` driver does not seem to work properly for the owners of `rtl8187se` cards.  
A friend has reported getting only 15% signal regardless the network.

## The solution

I grabbed the module from version **3.14** before it was deleted, changed the Makefile a bit to allow building it as an external module, and made packages for Archlinux / Gentoo to make the process easier.  
It's unlikely a rebuilt will be needed for minor kernel versions. For the next major versions we'll have to wait and see.  

To blacklist the `rtl8180` module enter the following:

    echo "blacklist rtl8180" > /etc/modprobe.d/rtl8180_blacklist.conf

If the `r8187se` is not loaded automatically, you can add it yourself in Archlinux & Gentoo (with systemd):

    echo r8187se > /etc/modules-load.d/r8187se.conf

For Gentoo with OpenRC, add it to the modules array: `modules="... r8187se"` in `/etc/conf.d/modules`

## Distribution packages

### Archlinux

The package is provided by the AUR. You can install it with an AUR helper of your choice: `rtl8187se` or manually by invoking the following commands as a regular user. (to build packages from the AUR, the `base-devel` package group is assumed to be installed)

    wget https://aur.archlinux.org/packages/rt/rtl8187se/rtl8187se.tar.gz
    tar xf rtl8187se.tar.gz
    cd rtl8187se
    makepkg -si

### Gentoo

The package is provided by the `gentoo-el` overlay. You can install it with the following commands as root. (you need to have `layman` installed and configured)

    layman -a gentoo-el
    emerge net-wireless/rtl8187se
