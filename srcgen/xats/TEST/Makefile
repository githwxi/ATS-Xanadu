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
# test_filepath
#
test_filepath: \
test_filepath_dats
test_filepath_dats: \
test_filepath.dats; $(MYATSCC) $<
regress:: test_filepath_dats; ./test_filepath_dats

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
prelude:: list_sats
prelude:: list_dats
prelude:: list_vt_sats
prelude:: list_vt_dats
prelude:: verbopr_sats

PRELUDE=./../../../prelude

list_sats:; \
$(CAT) $(PRELUDE)/SATS/list.sats | $(XATSOPT) --static
list_dats:; \
$(CAT) $(PRELUDE)/DATS/list.dats | $(XATSOPT) --dynamic

list_vt_sats: ; \
$(CAT) $(PRELUDE)/SATS/list_vt.sats | $(XATSOPT) --static
list_vt_dats: ; \
$(CAT) $(PRELUDE)/DATS/list_vt.dats | $(XATSOPT) --dynamic

print_sats: ; \
$(CAT) $(PRELUDE)/SATS/print.sats | $(XATSOPT) --static
print_dats: ; \
$(CAT) $(PRELUDE)/DATS/print.dats | $(XATSOPT) --dynamic

verbopr_sats: ; \
$(CAT) $(PRELUDE)/SATS/verbopr.sats | $(XATSOPT) --static

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
cleanall:: ; $(RMF) test_filepath_dats

######

###### end of [Makefile] ######
