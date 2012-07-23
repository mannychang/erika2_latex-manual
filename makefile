NIOS2 = arch_nios2 arch_nios2_api_tutorial arch_nios2_fifo_tutorial arch_nios2_lwip_tutorial arch_nios2_multicore_tutorial 
INTERNAL = eedoc_internal
CORE = ee_basic_refman ee_porting ee_refman ee_com_refman rtdruid_refman
FLEX = flex_refman


help:
	@echo Available commands:
	@echo
	@echo make clean
	@echo
	@echo make nios2
	@echo make internal
	@echo make core 
	@echo make eeb_gpl
	@echo make flex
	@echo
	@echo make web-manuals
	@echo
	@echo make install-test
	@echo make install

clean:
	for x in $(NIOS2) $(INTERNAL) $(CORE) $(FLEX); do make -C $${x} clean; done;
	rm -fr *.pdf *.tgz
	rm -fr *.php

nios2:
	for x in $(NIOS2); do make -C $${x}; done;

flex:
	for x in $(FLEX); do make -C $${x}; done;

internal:
	for x in $(INTERNAL); do make -C $${x}; done;

core:
	for x in $(CORE); do make -C $${x}; done;

eeb_gpl: core
	tar czf eeb_manuals.tgz *.pdf

web-manuals: nios2 flex common eeb_gpl

# this options execute the FTP script to upload everything
# into the Evidence website
install:
	lftp -f ./common/autoftp

# this options execute the FTP script to upload everything
# into the Evidence website but with a different name
# for the PHP manual page, so that it can be tested using
# an hidden page of the website after uploading changes
# scripts
install-test:
	mv dynamic-man.php dynamic-man-test.php 
	lftp -f ./common/autoftp
	mv dynamic-man-test.php dynamic-man.php
