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
PRELUDE_CM=srcgen2_prelude.scm
# XATSLIB_CM=srcgen2_xatslib.scm
##################################################################
SRCGEN1_PRELUDE_CM=srcgen1_prelude.scm
# SRCGEN1_XATSLIB_CM=srcgen1_xatslib.scm
##################################################################
##################################################################
all::
##################################################################
all:: prelude
# all:: xatslib
all:: srcgen1_prelude
# all:: srcgen1_xatslib
##################################################################
##################################################################
prelude:: ; \
$(PRINTF) ";; %s\n" "`date`" > $(PRELUDE_CM)
prelude:: ; $(CAT) srcgen2_prelude_hd >> $(PRELUDE_CM)
##################################################################
prelude:: \
xtop000
xtop000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/xtop000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
gbas000
gbas000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/gbas000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
gdbg000
gdbg000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/gdbg000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
gint000
gint000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/gint000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
bool000
bool000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/bool000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
char000
char000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/char000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
gflt000
gflt000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/gflt000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
strn000
strn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/strn000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
list000
list000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/list000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
optn000
optn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/optn000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
strm000
strm000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/strm000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
strx000
strx000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/strx000.cats >> $(PRELUDE_CM)
##################################################################
prelude:: \
axrf000
axrf000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/axrf000.cats >> $(PRELUDE_CM)
prelude:: \
axsz000
axsz000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/CM/axsz000.cats >> $(PRELUDE_CM)
##################################################################
##################################################################
xatslib:: ; \
$(PRINTF) ";; %s\n" "`date`" > $(XATSLIB_CM)
xatslib:: ; $(CAT) srcgen2_xatslib_hd >> $(XATSLIB_CM)
##################################################################
xatslib:: \
dynarr0
dynarr0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/CM/dynarr0.cats >> $(XATSLIB_CM)
##################################################################
xatslib:: \
hashmp0
hashmp0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/CM/hashmp0.cats >> $(XATSLIB_CM)
##################################################################
##################################################################
#
srcgen1_prelude:: ; \
$(PRINTF) ";; %s\n" "`date`" > $(SRCGEN1_PRELUDE_CM)
#
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/CM/basics0.cats >> $(SRCGEN1_PRELUDE_CM)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/CM/basics1.cats >> $(SRCGEN1_PRELUDE_CM)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/CM/basics2.cats >> $(SRCGEN1_PRELUDE_CM)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/CM/basics3.cats >> $(SRCGEN1_PRELUDE_CM)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/CM/xatsopt.cats >> $(SRCGEN1_PRELUDE_CM)
#
##################################################################
#
srcgen1_xatslib:: ; \
$(PRINTF) ";; %s\n" "`date`" > $(SRCGEN1_XATSLIB_CM)
srcgen1_xatslib:: ; $(CAT) \
$(SRCGEN1_XATSLIBD)/libcats/DATS/CATS/CM/libcats.cats >> $(SRCGEN1_XATSLIB_CM)
#
##################################################################
##################################################################
# end-of
# [ATS3-XANADU/srcgen2/xats2cm/srcgen1/xshared/runtime/Makefile]
##################################################################
##################################################################
