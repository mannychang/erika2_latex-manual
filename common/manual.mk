# common part of the Evidence manual makefiles
# new dependencies by /tool

.PHONY: eps all preview clean

###############################################################################
# Configuration Section
# This should be the only section you need to modify


# These variables were initially all defined inside the makefile 
ifdef NAME
ifndef MAIN
MAIN = $($(NAME)__MAIN)
endif
ifndef VERSION
VERSION = $($(NAME)__VER)
endif
ifndef MAIN_NAME
MAIN_NAME = $($(NAME)__MAIN_NAME)_$($(NAME)__VER)
endif
endif


ifndef MAN_BASE_DIR
MAN_BASE_DIR = ..
endif

BACKSLASH="\\"
MYOS=$(shell uname -s)
ifeq ($(findstring Linux, $(MYOS)), Linux)
  # This is Linux, not Cygwin; backslashes are interpreted by Make
  BACKSLASH="\\\\"
endif

# Any supporting files needed to compile $(MAIN).tex such as
# included tex files or figures
SUPPORTS = 

# Other files that will be included in an archive
OTHER_FILES =

# Uncomment the next two lines if you wish to use bibtex.  These lines
# assume the bib file is $(MAIN).bib.  Modify if needed.
BIBFILE = $(MAN_BASE_DIR)/common/biblio.bib
BBLFILE = $(MAIN).bbl

# Program locations and options
LATEX = latex
LATEXFLAGS = -interaction=nonstopmode
BIBTEX = bibtex
PDFLATEX = pdflatex
DVIPS = dvips
DVIPSFLAGS = -R0 -t a4 -I c
#DVIPSFLAGS = -R0 -t a4 -a -P pdf

ACROREAD = acroread
XDVI = xdvi
GGV = ggv

###############################################################################
# File lists

DISTFILES = *.aux *.log *~ *.blg *.bbl *.dvi *.toc *.idx *.out *.ilg *.ind *.lof *.lot
CLEANFILES = $(DISTFILES) *.ps *.pdf *.zip *.tar.gz

###############################################################################
# Build rules

.PHONY: all
all: theflag

theflag:
	@make -C . thepdffile
	touch theflag

thepdffile: eps dynamic_version.tex $(PHP_DEPS) $(MAIN).dvi $(MAIN).ps $(MAIN).pdf $(MAN_BASE_DIR)/$(MAIN_NAME).pdf

preview: $(MAIN).dvi
	$(XDVI) $(MAIN).dvi &

$(MAIN).aux: $(MAIN).tex $(SUPPORTS) $(BIBFILE)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

$(MAIN).bbl: $(MAIN).tex $(BIBFILE) $(MAIN).aux
	$(BIBTEX) $(MAIN)

$(MAIN).dvi: $(MAIN).tex $(MAIN).aux $(BBLFILE) $(BIBFILE)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	makeindex $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

$(MAIN).ps: $(MAIN).dvi
	$(DVIPS) $(MAIN).dvi -o $@ $(DVIPSFLAGS)

$(MAIN).pdf: $(MAIN).ps $(MAIN).tex $(MAIN).aux $(BIBFILE) $(BBLFILE)
	ps2pdf $(MAIN).ps

$(MAN_BASE_DIR)/$(MAIN_NAME).pdf: $(MAIN).pdf
	if test $(MAIN_NAME); then cp $(MAIN).pdf $(MAN_BASE_DIR)/$(MAIN_NAME).pdf; fi
	cp dynamic-man.php $(MAN_BASE_DIR)

###############################################################################
# php sources for the automatic update of the Evidence website
# 
# as you can see, there is a chain of only two "sed" commands
# this is done assuming that there are at most 3 version numbers
# so that AA_BB_CC is good, while AA_BB_CC_DD is not
# ... it may be done better ;-)
dynamic_version.tex: version.mk
	echo -n $(BACKSLASH)"def"$(BACKSLASH)"version{" > dynamic_version.tex
	echo -n $(VERSION) | sed "s/_/./" | sed "s/_/./" >> dynamic_version.tex
	echo -n "}" >> dynamic_version.tex

###############################################################################
# Clean-up rules

clean:
	rm -f $(DISTFILES) $(CLEANFILES) $(PHP_DEPS) $(EPS_DIA_FILES) $(EPS_FIG_FILES) theflag
	rm -f dynamic_version.tex deps

###############################################################################
# Automatic generation of eps files from sources

DIA_FILES = $(shell find . -iname *.dia)
EPS_DIA_FILES = $(patsubst %.dia,%.eps, $(DIA_FILES))

FIG_FILES = $(shell find . -iname *.fig)
EPS_FIG_FILES = $(patsubst %.fig,%.eps, $(FIG_FILES))

eps: $(EPS_DIA_FILES) $(EPS_FIG_FILES)

%.eps : %.dia
	dia $< -t eps-builtin -e $@

%.eps : %.fig
	fig2dev -L eps $< $@



# Generation of dependencies
############################

# The idea is that there is a file which must be older than
# everybody. If the file is not older, then remake everything.

-include deps

# deps depends on the flag and not on the PHONY rule!
deps:
	echo theflag: $(wildcard *.tex images/*.png images/*.dia images/*.eps images/*.fig images/*.jpg) version.mk > deps

