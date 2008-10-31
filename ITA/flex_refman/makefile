MAN_BASE_DIR = ../..
DOCUMENT_NAME = FLEX_REFMAN_ITA
include $(MAN_BASE_DIR)/common/ver_defs.mk

#tullio, queste tre variabili potrebbero essere buttate nel makefile...
MAIN := $($(DOCUMENT_NAME)__MAIN)
VERSION := $($(DOCUMENT_NAME)__VER)
MAIN_NAME := $($(DOCUMENT_NAME)__MAIN_NAME)_$($(DOCUMENT_NAME)__VER)

PHP_DEPS += dynamic-man.php

include $(MAN_BASE_DIR)/common/manual.mk
include $(MAN_BASE_DIR)/common/php_man.mk

