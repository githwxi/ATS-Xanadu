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

# all:: \
# test_symbol
# test_symbol: \
# test_symbol_dats
# test_symbol_dats: \
# test_symbol.dats; $(MYATSCC) $<
# regress:: test_symbol_dats; ./test_symbol_dats
# cleanall:: ; $(RMF) test_symbol_dats

######

# all:: \
# test_filepath
# test_filepath: \
# test_filepath_dats
# test_filepath_dats: \
# test_filepath.dats; $(MYATSCC) $<
# regress:: test_filepath_dats; ./test_filepath_dats
# cleanall:: ; $(RMF) test_filepath_dats

######

SATS=\
./../SATS/xerror.sats \

all:: \
test_xats_main
test_xats_main: \
test_xats_main_dats
test_xats_main_dats: \
test_xats_main.dats; \
$(PATSCC) \
-DATS_MEMALLOC_LIBC \
-I./.. -o $@ $(SATS) $<
regress:: ; ./test_xats_main_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *_sats.c
clean:: ; $(RMF) *_dats.c

cleanall:: clean
cleanall:: ; $(RMF) test_xats_main_dats

######

###### end of [Makefile] ######
