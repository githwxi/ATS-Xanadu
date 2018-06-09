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
regress:: test_symbol_dats; ./test_symbol_dats
cleanall:: ; $(RMF) test_symbol_dats

######

all:: \
test_filepath
test_filepath: \
test_filepath_dats
test_filepath_dats: \
test_filepath.dats; $(MYATSCC) $<
regress:: test_filepath_dats; ./test_filepath_dats
cleanall:: ; $(RMF) test_filepath_dats

######

all:: \
test_location
test_location: \
test_location_dats
test_location_dats: \
test_location.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -I./.. $< -o $@
regress:: test_location_dats; ./test_location_dats
cleanall:: ; $(RMF) test_location_dats

######

all:: \
test_lexbuf
test_lexbuf: \
test_lexbuf_dats
test_lexbuf_dats: \
test_lexbuf.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -I./.. $< -o $@
regress:: test_lexbuf_dats; ./test_lexbuf_dats
cleanall:: ; $(RMF) test_lexbuf_dats

######

all:: \
test_lexing_kword
test_lexing_kword: \
test_lexing_kword_dats
test_lexing_kword_dats: \
test_lexing_kword.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -I./.. $< -o $@
regress:: test_lexing_kword_dats; ./test_lexing_kword_dats
cleanall:: ; $(RMF) test_lexing_kword_dats

######

all:: \
test_lexing_token
test_lexing_token: \
test_lexing_token_dats
test_lexing_token_dats: \
test_lexing_token.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -I./.. $< -o $@
regress:: test_lexing_token_dats; ./test_lexing_token_dats
cleanall:: ; $(RMF) test_lexing_token_dats

######

all:: \
test_lexing_util0
test_lexing_util0: \
test_lexing_util0_dats
test_lexing_util0_dats: \
test_lexing_util0.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -I./.. $< -o $@
regress:: test_lexing_util0_dats; ./test_lexing_util0_dats
cleanall:: ; $(RMF) test_lexing_util0_dats

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
