AVR5  = arch_avr5  arch_avr5_tutorial
PIC30 = arch_pic30 arch_pic30_tutorial arch_pic30_mplab
NIOS2 = arch_nios2 arch_nios2_api_tutorial arch_nios2_fifo_tutorial arch_nios2_lwip_tutorial arch_nios2_multicore_tutorial 
INTERNAL = eedoc_internal
CORE = ee_basic_refman ee_porting ee_refman rtdruid_refman
FLEX = flex_refman flex_scicos
ITA = ITA/arch_pic30_tutorial ITA/ee_basic_refman ITA/flex_refman


help:
	@echo Available commands:
	@echo
	@echo make clean
	@echo
	@echo make pic30
	@echo make avr5
	@echo make nios2
	@echo make internal
	@echo make core 
	@echo make eeb_gpl
	@echo make flex
	@echo make italian
	@echo
	@echo make web-manuals
	@echo
	@echo make install-test
	@echo make install

clean:
	for x in $(PIC30) $(AVR5) $(NIOS2) $(INTERNAL) $(CORE) $(FLEX) $(ITA); do make -C $${x} clean; done;
	rm -fr *.pdf *.tgz
	rm -fr *.php
	
avr5:
	for x in $(AVR5); do make -C $${x}; done;
pic30:
	for x in $(PIC30); do make -C $${x}; done;

nios2:
	for x in $(NIOS2); do make -C $${x}; done;

flex:
	for x in $(FLEX); do make -C $${x}; done;

internal:
	for x in $(INTERNAL); do make -C $${x}; done;

core:
	for x in $(CORE); do make -C $${x}; done;

italian:
	for x in $(ITA); do make -C $${x}; done;

eeb_gpl: pic30 core
	tar czf eeb_manuals.tgz *.pdf

web-manuals: pic30 nios2 flex common eeb_gpl italian

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
