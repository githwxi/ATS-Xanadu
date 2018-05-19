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

all:: \
test_filepath

test_filepath: \
test_filepath_dats
test_filepath_dats: \
test_filepath.dats; $(MYATSCC) $<
regress:: \
test_filepath_dats; ./test_filepath_dats
cleanall:: ; $(RMF) test_filepath_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

cleanall:: ; $(RMF) test_*_dats.c

######

###### end of [Makefile] ######
