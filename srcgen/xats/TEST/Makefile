######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
MYATSCC=$(PATSHOME)/bin/myatscc

XATSOPT=$(XATSHOME)/bin/xatsopt

######

all::
regress::
cleanall::

######
#
# all:: \
# test00
# all:: \
# test01
#
test00: ; \
$(CAT) ./DATA/test00.dats | $(XATSOPT) --dynamic
test01: ; \
$(CAT) ./DATA/test01.dats | $(XATSOPT) --dynamic
test02: ; \
$(CAT) ./DATA/test02.dats | $(XATSOPT) --dynamic
#
######

# all:: prelude
prelude:: gbas_sats
prelude:: gbas_dats
prelude:: gord_sats
prelude:: gord_dats
prelude:: list_sats
prelude:: list_dats
prelude:: gseq_dats

######

PRELUDE=$(XATSHOME)/prelude

######

basics_sats:; \
$(XATSOPT) -s $(PRELUDE)/basics.sats

######

gbas_sats:; \
$(XATSOPT) -s $(PRELUDE)/SATS/gbas.sats
gbas_dats:; \
$(XATSOPT) -d $(PRELUDE)/DATS/gbas.dats

######

gord_sats:; \
$(XATSOPT) -s $(PRELUDE)/SATS/gord.sats
gord_dats:; \
$(XATSOPT) -d $(PRELUDE)/DATS/gord.dats

######

garr_sats:; \
$(XATSOPT) -s $(PRELUDE)/SATS/garr.sats 
garr_dats:; \
$(XATSOPT) -d $(PRELUDE)/DATS/garr.dats

######

gseq_sats:; \
$(XATSOPT) -s $(PRELUDE)/SATS/gseq.sats 
gseq_dats:; \
$(XATSOPT) -d $(PRELUDE)/DATS/gseq.dats

######

list_sats:; \
$(XATSOPT) -s $(PRELUDE)/SATS/list.sats
list_dats:; \
$(XATSOPT) -d $(PRELUDE)/DATS/list.dats

######

optn_sats:; \
$(XATSOPT) -s $(PRELUDE)/SATS/optn.sats
optn_dats:; \
$(XATSOPT) -d $(PRELUDE)/DATS/optn.dats

######

all:: \
syntax_sta
syntax_sta: ; \
$(CAT) ./DATA/syntax_sta.sats | $(XATSOPT) --static

all:: \
syntax_dyn
syntax_dyn: ; \
$(CAT) ./DATA/syntax_dyn.dats | $(XATSOPT) --dynamic

######

testall:: all
testall:: regress
testall:: cleanall

######

CAT=cat
RMF=rm -f

######

clean:: ; $(RMF) *_sats.c
clean:: ; $(RMF) *_dats.c

cleanall:: clean
cleanall:: ; $(RMF) test_symbol_dats
cleanall:: ; $(RMF) test_filpath_dats

######

###### end of [Makefile] ######
