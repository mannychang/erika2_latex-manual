# generate the dynamic-man.php to be uploaded into the Evidence website
dynamic-man.php: version.mk
	@echo "<!--" > dynamic-man.php 
	@echo "This file is automatically generated by the" >> dynamic-man.php
	@echo "Evidence reference manual generator." >> dynamic-man.php
	@echo "by /toOl" >> dynamic-man.php
	@echo "-->" >> dynamic-man.php

	@echo >> dynamic-man.php

	@echo "<table border=\"0\" width=\"100%\">" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tbody>" >> dynamic-man.php

#-------------------------------------------------------------------

	@echo >> dynamic-man.php
	@echo "<tr><td style=\"color: #000000; background-color: #dddddd; word-spacing: 2px; letter-spacing: 1px\">&nbsp;<strong>Erika Enterprise</strong></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(EE_REFMAN__MAIN_NAME)_$(EE_REFMAN__VER).pdf\" target=\"_blank\">Erika Enterprise Reference Manual v. " >> dynamic-man.php
	@echo -n $(EE_REFMAN__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(EE_BASIC_REFMAN__MAIN_NAME)_$(EE_BASIC_REFMAN__VER).pdf\" target=\"_blank\">Erika Enterprise Minimal API Reference Manual v. " >> dynamic-man.php
	@echo -n $(EE_BASIC_REFMAN__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(EE_PORTING__MAIN_NAME)_$(EE_PORTING__VER).pdf\" target=\"_blank\">Erika Enterprise Conformance Classes Comparison Guide v. " >> dynamic-man.php
	@echo -n $(EE_PORTING__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(EE_COM_REFMAN__MAIN_NAME)_$(EE_COM_REFMAN__VER).pdf\" target=\"_blank\">Erika Enterprise COM Stack reference manual v. " >> dynamic-man.php
	@echo -n $(EE_COM_REFMAN__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tr><td>&nbsp;</td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tr><td style=\"color: #000000; background-color: #dddddd; word-spacing: 2px; letter-spacing: 1px\">&nbsp;<strong>RT-Druid Code Generator</strong></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(RTDRUID_REFMAN__MAIN_NAME)_$(RTDRUID_REFMAN__VER).pdf\" target=\"_blank\">RT-Druid Reference Manual v. " >> dynamic-man.php
	@echo -n $(RTDRUID_REFMAN__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

#-------------------------------------------------------------------

	@echo >> dynamic-man.php
	@echo "<tr><td>&nbsp;</td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tr><td style=\"color: #000000; background-color: #dddddd; word-spacing: 2px; letter-spacing: 1px\">&nbsp;<strong>Erika Enterprise for dsPIC (R) DSC</strong></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"http://erika.tuxfamily.org/wiki/index.php?title=Microchip_dsPIC\" target=\"_blank\">Erika Enterprise Manual for dsPIC (R) DSC 30 family (Wiki version) " >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"http://erika.tuxfamily.org/wiki/index.php?title=Tutorial:_Installing_ERIKA_and_RT-Druid,_and_compile_your_first_application\" target=\"_blank\">Erika Enterprise Tutorial for dsPIC (R) DSC 30 family (Wiki version)" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

#-------------------------------------------------------------------

	@echo >> dynamic-man.php
	@echo "<tr><td>&nbsp;</td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tr><td style=\"color: #000000; background-color: #dddddd; word-spacing: 2px; letter-spacing: 1px\">&nbsp;<strong>FLEX Embedded Platform</strong></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(FLEX_REFMAN__MAIN_NAME)_$(FLEX_REFMAN__VER).pdf\" target=\"_blank\">FLEX Reference Manual v. " >> dynamic-man.php
	@echo -n $(FLEX_REFMAN__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(FLEX_SCICOS__MAIN_NAME)_$(FLEX_SCICOS__VER).pdf\" target=\"_blank\">Scicos for FLEX Reference Manual v. " >> dynamic-man.php
	@echo -n $(FLEX_SCICOS__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

#-------------------------------------------------------------------

	@echo >> dynamic-man.php
	@echo "<tr><td>&nbsp;</td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tr><td style=\"color: #000000; background-color: #dddddd; word-spacing: 2px; letter-spacing: 1px\">&nbsp;<strong>Erika Enterprise for the Altera Nios II Platform</strong></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_NIOS2__MAIN_NAME)_$(ARCH_NIOS2__VER).pdf\" target=\"_blank\">Erika Enterprise Manual for Altera Nios II v. " >> dynamic-man.php
	@echo -n $(ARCH_NIOS2__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_NIOS2_API_TUTORIAL__MAIN_NAME)_$(ARCH_NIOS2_API_TUTORIAL__VER).pdf\" target=\"_blank\">Erika Enterprise API Tutorial for Altera Nios II v. " >> dynamic-man.php
	@echo -n $(ARCH_NIOS2_API_TUTORIAL__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_NIOS2_MULTICORE_TUTORIAL__MAIN_NAME)_$(ARCH_NIOS2_MULTICORE_TUTORIAL__VER).pdf\" target=\"_blank\">Erika Enterprise Multicore Tutorial for Altera Nios II v. " >> dynamic-man.php
	@echo -n $(ARCH_NIOS2_MULTICORE_TUTORIAL__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_NIOS2_LWIP_TUTORIAL__MAIN_NAME)_$(ARCH_NIOS2_LWIP_TUTORIAL__VER).pdf\" target=\"_blank\">Erika Enterprise LWIP Tutorial for Altera Nios II v. " >> dynamic-man.php
	@echo -n $(ARCH_NIOS2_LWIP_TUTORIAL__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_NIOS2_FIFO_TUTORIAL__MAIN_NAME)_$(ARCH_NIOS2_FIFO_TUTORIAL__VER).pdf\" target=\"_blank\">Erika Enterprise FIFO message passing Tutorial for Altera Nios II v. " >> dynamic-man.php
	@echo -n $(ARCH_NIOS2_FIFO_TUTORIAL__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php


#-------------------------------------------------------------------

	@echo >> dynamic-man.php
	@echo "<tr><td>&nbsp;</td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<tr><td style=\"color: #000000; background-color: #dddddd; word-spacing: 2px; letter-spacing: 1px\">&nbsp;<strong>Erika Enterprise for the AVR5 Platform</strong></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_AVR5__MAIN_NAME)_$(ARCH_AVR5__VER).pdf\" target=\"_blank\">Erika Enterprise Manual for AVR5 v. " >> dynamic-man.php
	@echo -n $(ARCH_AVR5__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo -n "<tr><td><a href=\"download/manuals/pdf/$(ARCH_AVR5_TUTORIAL__MAIN_NAME)_$(ARCH_AVR5_TUTORIAL__VER).pdf\" target=\"_blank\">Erika Enterprise API Tutorial for AVR5 v. " >> dynamic-man.php
	@echo -n $(ARCH_AVR5_TUTORIAL__VER) | sed "s/_/./" | sed "s/_/./" >> dynamic-man.php
	@echo "&nbsp;</a></td></tr>" >> dynamic-man.php

#-------------------------------------------------------------------

	@echo >> dynamic-man.php
	@echo "</tbody>" >> dynamic-man.php
	@echo "</table>" >> dynamic-man.php

	@echo >> dynamic-man.php
	@echo "<p>" >> dynamic-man.php
	@echo -n "Last update: " >> dynamic-man.php
	@date >> dynamic-man.php
	@echo "</p>" >> dynamic-man.php
