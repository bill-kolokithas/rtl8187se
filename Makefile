EXTRA_CFLAGS += -DSW_ANTE
EXTRA_CFLAGS += -DTX_TRACK
EXTRA_CFLAGS += -DHIGH_POWER
EXTRA_CFLAGS += -DSW_DIG
EXTRA_CFLAGS += -DRATE_ADAPT
EXTRA_CFLAGS += -DENABLE_LPS

ifneq ($(KERNELRELEASE),)
	r8187se-y :=			\
		r8180_core.o		\
		r8180_wx.o		\
		r8180_rtl8225z2.o	\
		r8185b_init.o		\
		r8180_dm.o		\
		ieee80211/dot11d.o			\
		ieee80211/ieee80211_softmac.o		\
		ieee80211/ieee80211_rx.o		\
		ieee80211/ieee80211_tx.o		\
		ieee80211/ieee80211_wx.o		\
		ieee80211/ieee80211_module.o		\
		ieee80211/ieee80211_softmac_wx.o	\
		ieee80211/ieee80211_crypt.o		\
		ieee80211/ieee80211_crypt_tkip.o	\
		ieee80211/ieee80211_crypt_ccmp.o	\
		ieee80211/ieee80211_crypt_wep.o

	obj-m := r8187se.o
else
	KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	rm -rf ieee80211/*.o ieee80211/.*.cmd *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions modules.order Module.symvers

endif
