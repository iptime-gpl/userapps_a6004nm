SUBDIRS:=wireless_tools.linux3.10 lib/ul_lib busybox.nas udhcp-0.9.8 boa-0.94.13/src netfilter-q iptables-1.4.10 poptop-1.1.4 iproute2 bridge-utils-1.1/libbridge bridge-utils-1.1/brctl miniupnpd-1.6 smtpclient igmpproxy captcha miniupnpc-1.6

PHONY := all $(SUBDIRS)
all: $(SUBDIRS)
	@echo -e "\nDone!\n"

$(SUBDIRS):
	echo "========================================================================"
	echo -e "\033[32m$$i\033[0m"
	echo "------------------------------------------------------------------------"
	$(MAKE) -C $@

PHONY += clean
clean:
	for i in $(SUBDIRS) ; do \
		echo -e "\033[31m$$i\033[0m"; \
		$(MAKE) -C $$i clean; \
	done

.PHONY: $(PHONY)
