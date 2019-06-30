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

######
#
# all:: \
# test_symbol
#
test_symbol: \
test_symbol_dats
test_symbol_dats: \
test_symbol.dats; $(MYATSCC) $<
regress:: test_symbol_dats; ./test_symbol_dats

######
#
# all:: \
# test_filpath
#
test_filpath: \
test_filpath_dats
test_filpath_dats: \
test_filpath.dats; $(MYATSCC) $<
regress:: test_filpath_dats; ./test_filpath_dats

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

all:: prelude
prelude:: gbas_sats
prelude:: gbas_dats

PRELUDE=./../../../prelude

basics_sats:; \
$(CAT) $(PRELUDE)/basics.sats | $(XATSOPT) --static

gbas_sats:; \
$(CAT) $(PRELUDE)/SATS/gbas.sats | $(XATSOPT) --static
gbas_dats:; \
$(CAT) $(PRELUDE)/DATS/gbas.dats | $(XATSOPT) --dynamic

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
