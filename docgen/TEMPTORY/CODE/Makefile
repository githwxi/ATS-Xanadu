######
#
# A simple Makefile
#
######
CAT=cat
CPF=cp -f
RMF=rm -f
ECHO=echo
######
XATSOPT=$(XATSHOME)/bin/xatsopt
######
all:: \
TBP-intro
all:: \
GSEQ-intro
all:: \
QueenPuzzle
######
testall:: all
testall:: cleanall
######
TBP-intro: ; \
$(XATSOPT) -d TBP-intro.dats
######
GSEQ-intro: ; \
$(XATSOPT) -d GSEQ-intro.dats
######
QueenPuzzle: ; \
$(XATSOPT) -d QueenPuzzle.dats
######
clean:: ; $(RMF) *~
######
cleanall:: clean
cleanall:: ; $(RMF) output
######

###### end of [Makefile] ######
