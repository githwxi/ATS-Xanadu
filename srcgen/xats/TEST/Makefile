######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
MYATSCC=$(PATSHOME)/bin/myatscc

######

all::

######

all:: \
test_symbol

test_symbol: \
test_symbol_dats
test_symbol_dats: \
test_symbol.dats; $(MYATSCC) $<
regress:: \
test_symbol_dats; ./test_symbol_dats
cleanall:: ; $(RMF) test_symbol_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

###### end of [Makefile] ######
