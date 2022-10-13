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
test01_cblist

test01_cblist: \
test01_cblist_dats
test01_cblist_dats: \
test01_cblist.dats; $(MYATSCC) $<
regress:: test01_cblist_dats; ./$<
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

cleanall:: ; $(RMF) test01_cblist_dats

######

###### end of [Makefile] ######
