######
#
# For building xinterp
#
######

CC=gcc
SED=sed
RMF=rm -f

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
CFLAGS=
#
# CFLAGS=-g
# CFLAGS=-g -O
# CFLAGS=-g -O2
#
GCFLAG=
GCFLAG=-DATS_MEMALLOC_LIBC
GCFLAG=-DATS_MEMALLOC_GCBDW
#
LIBGC=
LIBGC=-lgc
#
######

SRCSATS := \
interp0.sats
SRCDATS := \
interp0.dats \
interp0_print.dats \
interp0_envmap.dats \
interp0_dynexp.dats \

######

OBJSATS := \
$(patsubst %.sats, BUILD/%_sats.o, $(SRCSATS))
OBJDATS := \
$(patsubst %.dats, BUILD/%_dats.o, $(SRCDATS))

######

INCLUDE:=
INCLUDE+=-I"."
INCLUDE+=-I"./BUILD/xats"
LIBRARY:=-L./../../lib -lxatsopt

######
#
all: \
xinterp
xinterp: \
DATS/xinterp.dats \
$(OBJSATS) $(OBJDATS) ; \
$(PATSCC) \
-cleanaft -o xinterp \
$(INCLUDE) $(GCFLAG) $^ $(LIBGC) $(LIBRARY)
#
######

BUILD/%_sats.c: ./SATS/%.sats ; \
  $(PATSOPT) $(CFLAGS) -o $@ --static $<
BUILD/%_dats.c: ./DATS/%.dats ; \
  $(PATSOPT) $(CFLAGS) $(GCFLAG) -o $@ --dynamic $<

######

BUILD/%_sats.o: \
BUILD/%_sats.c; $(PATSCC) $(INCLUDE) $(CFLAGS) -o $@ -c $<
BUILD/%_dats.o: \
BUILD/%_dats.c; $(PATSCC) $(INCLUDE) $(CFLAGS) -o $@ -c $<

######
#
# HX-2018-10-07:
# '--output-a .depend' means
# appending instead of overwriting
#
SATS_SRCSATS := \
$(patsubst %.sats, SATS/%.sats, $(SRCSATS))
DATS_SRCDATS := \
$(patsubst %.dats, DATS/%.dats, $(SRCDATS))
#
depend:: ; $(RMF) .depend
#
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -s $(SATS_SRCSATS)
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d $(DATS_SRCDATS)
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d DATS/xinterp.dats
#
depend:: ; \
$(SED) -i -e 's/^SATS/BUILD/' -e 's/^DATS/BUILD/' .depend
#
-include .depend
#
######

clean:: ; $(RMF) BUILD/*_?ats.c
clean:: ; $(RMF) BUILD/*_?ats.o
clean:: ; $(RMF) xinterp_dats.o
clean:: ; $(RMF) xinterp_dats.c

cleanall:: clean
cleanall:: ; $(RMF) xinterp

######

###### end of [Makefile] ######
