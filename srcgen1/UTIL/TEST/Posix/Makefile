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
all:: \
test02_mylibc

######

test01_cblist: \
test01_cblist_dats
test01_cblist_dats: \
test01_cblist.dats; $(MYATSCC) $<
regress:: \
test01_cblist_dats; ./$<
cleanall:: ; $(RMF) test01_cblist_dats

######

test02_mylibc: \
test02_mylibc_dats
test02_mylibc_dats: \
test02_mylibc.dats; $(MYATSCC) $<
regress:: \
test02_mylibc_dats; ./$<
cleanall:: ; $(RMF) test02_mylibc_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

###### end of [Makefile] ######
