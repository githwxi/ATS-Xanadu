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

all:: \
syntax_sta
syntax_sta: ; \
$(CAT) ./DATA/syntax_sta.sats | $(XATSOPT) --static

all:: \
syntax_dyn
syntax_dyn: ; \
$(CAT) ./DATA/syntax_dyn.dats | $(XATSOPT) --dynamic

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

PRELUDE=./../../../prelude

######

basics_sats:; \
$(CAT) $(PRELUDE)/basics.sats | $(XATSOPT) --static

######

gbas_sats:; \
$(CAT) $(PRELUDE)/SATS/gbas.sats | $(XATSOPT) --static
gbas_dats:; \
$(CAT) $(PRELUDE)/DATS/gbas.dats | $(XATSOPT) --dynamic

######

gord_sats:; \
$(CAT) $(PRELUDE)/SATS/gord.sats | $(XATSOPT) --static
gord_dats:; \
$(CAT) $(PRELUDE)/DATS/gord.dats | $(XATSOPT) --dynamic

######

list_sats:; \
$(CAT) $(PRELUDE)/SATS/list.sats | $(XATSOPT) --static
list_dats:; \
$(CAT) $(PRELUDE)/DATS/list.dats | $(XATSOPT) --dynamic

######

gseq_dats:; \
$(CAT) $(PRELUDE)/DATS/gseq.dats | $(XATSOPT) --dynamic

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
