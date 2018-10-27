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
cblist

cblist: \
cblist_dats
cblist_dats: \
cblist.dats; $(MYATSCC) $<
regress:: \
cblist_dats; ./cblist_dats
cleanall:: ; $(RMF) cblist_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

###### end of [Makefile] ######
