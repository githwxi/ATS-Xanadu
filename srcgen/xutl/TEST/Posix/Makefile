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
test_cblist

test_cblist: \
test_cblist_dats
test_cblist_dats: \
test_cblist.dats; $(MYATSCC) $<
regress:: \
test_cblist_dats; ./test_cblist_dats
cleanall:: ; $(RMF) test_cblist_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

###### end of [Makefile] ######
