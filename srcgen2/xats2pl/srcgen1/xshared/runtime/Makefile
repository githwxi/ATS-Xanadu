##################################################################
##################################################################
# beg of [Makefile]
##################################################################
##################################################################
CAT=cat
ECHO=echo
PRINTF=printf
##################################################################
PRELUDED=\
$(XATSHOME)/prelude
XATSLIBD=\
$(XATSHOME)/xatslib
SRCGEN1_PRELUDED=\
$(XATSHOME)/srcgen1/prelude
SRCGEN1_XATSLIBD=\
$(XATSHOME)/srcgen1/xatslib
##################################################################
PRECATS_PL=srcgen2_precats.pl
PRELUDE_PL=srcgen2_prelude.pl
XATSLIB_PL=srcgen2_xatslib.pl
##################################################################
SRCGEN1_PRELUDE_PL=srcgen1_prelude.pl
SRCGEN1_XATSLIB_PL=srcgen1_xatslib.pl
##################################################################
##################################################################
all::
##################################################################
all:: prelude
##################################################################
##################################################################
precats:: ; \
$(PRINTF) "## %s\n" "`date`" > $(PRECATS_PL)
precats:: ; $(CAT) srcgen2_precats_hd >> $(PRECATS_PL)
precats:: ; $(CAT) \
$(PRELUDED)/DATS/CATS/PL/OUTS/precats_dats.pl >> $(PRECATS_PL)
##################################################################
##################################################################
prelude:: ; \
$(PRINTF) "## %s\n" "`date`" > $(PRELUDE_PL)
prelude:: ; $(CAT) srcgen2_prelude_hd >> $(PRELUDE_PL)
##################################################################
prelude:: \
xtop000
xtop000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/xtop000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
gbas000
gbas000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/gbas000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
gdbg000
gdbg000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/gdbg000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
gint000
gint000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/gint000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
bool000
bool000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/bool000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
char000
char000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/char000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
gflt000
gflt000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/gflt000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
strn000
strn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/strn000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
list000
list000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/list000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
optn000
optn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/optn000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
strm000
strm000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/strm000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
strx000
strx000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/strx000.cats >> $(PRELUDE_PL)
##################################################################
prelude:: \
axrf000
axrf000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/axrf000.cats >> $(PRELUDE_PL)
prelude:: \
axsz000
axsz000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PL/axsz000.cats >> $(PRELUDE_PL)
##################################################################
##################################################################
xatslib:: ; \
$(PRINTF) "## %s\n" "`date`" > $(XATSLIB_PL)
xatslib:: ; $(CAT) srcgen2_xatslib_hd >> $(XATSLIB_PL)
##################################################################
xatslib:: \
dynarr0
dynarr0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/PL/dynarr0.cats >> $(XATSLIB_PL)
##################################################################
xatslib:: \
hashmp0
hashmp0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/PL/hashmp0.cats >> $(XATSLIB_PL)
##################################################################
##################################################################
#
srcgen1_prelude:: ; \
$(PRINTF) "## %s\n" "`date`" > $(SRCGEN1_PRELUDE_PL)
#
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PL/basics0.cats >> $(SRCGEN1_PRELUDE_PL)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PL/basics1.cats >> $(SRCGEN1_PRELUDE_PL)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PL/basics2.cats >> $(SRCGEN1_PRELUDE_PL)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PL/basics3.cats >> $(SRCGEN1_PRELUDE_PL)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PL/xatsopt.cats >> $(SRCGEN1_PRELUDE_PL)
#
##################################################################
#
srcgen1_xatslib:: ; \
$(PRINTF) "## %s\n" "`date`" > $(SRCGEN1_XATSLIB_PL)
srcgen1_xatslib:: ; $(CAT) \
$(SRCGEN1_XATSLIBD)/libcats/DATS/CATS/PL/libcats.cats >> $(SRCGEN1_XATSLIB_PL)
#
##################################################################
##################################################################
# end-of
# [ATS3-XANADU/srcgen2/xats2pl/srcgen1/xshared/runtime/Makefile]
##################################################################
##################################################################
