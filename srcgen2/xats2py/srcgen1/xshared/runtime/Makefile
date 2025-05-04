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
PRELUDE_PY=srcgen2_prelude.py
XATSLIB_PY=srcgen2_xatslib.py
##################################################################
SRCGEN1_PRELUDE_PY=srcgen1_prelude.py
SRCGEN1_XATSLIB_PY=srcgen1_xatslib.py
##################################################################
all::
##################################################################
all:: prelude
all:: xatslib
all:: srcgen1_prelude
all:: srcgen1_xatslib
##################################################################
prelude:: ; \
printf "## %s\n" "`date`" > $(PRELUDE_PY)
prelude:: ; \
$(CAT) srcgen2_prelude_hd >> $(PRELUDE_PY)
##################################################################
prelude:: \
xtop000
xtop000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/xtop000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
gbas000
gbas000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gbas000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
gdbg000
gdbg000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gdbg000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
gint000
gint000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gint000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
bool000
bool000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/bool000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
char000
char000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/char000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
gflt000
gflt000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gflt000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
strn000
strn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/strn000.cats >> $(PRELUDE_PY)
##################################################################
prelude:: \
axrf000
axrf000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/axrf000.cats >> $(PRELUDE_PY)
prelude:: \
axsz000
axsz000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/axsz000.cats >> $(PRELUDE_PY)
##################################################################
##################################################################
xatslib:: ; \
printf "## %s\n" "`date`" > $(XATSLIB_PY)
xatslib:: ; \
$(CAT) srcgen2_xatslib_hd >> $(XATSLIB_PY)
##################################################################
xatslib:: \
dynarr0
dynarr0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/PY/dynarr0.cats >> $(XATSLIB_PY)
##################################################################
xatslib:: \
hashmp0
hashmp0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/PY/hashmp0.cats >> $(XATSLIB_PY)
##################################################################
##################################################################
#
srcgen1_prelude:: ; \
$(PRINTF) "## %s\n" "`date`" > $(SRCGEN1_PRELUDE_PY)
#
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PY/basics0.cats >> $(SRCGEN1_PRELUDE_PY)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PY/basics1.cats >> $(SRCGEN1_PRELUDE_PY)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PY/basics2.cats >> $(SRCGEN1_PRELUDE_PY)
srcgen1_prelude:: ; $(CAT) \
$(SRCGEN1_PRELUDED)/DATS/CATS/PY/basics3.cats >> $(SRCGEN1_PRELUDE_PY)
#
##################################################################
#
srcgen1_xatslib:: ; \
$(PRINTF) "## %s\n" "`date`" > $(SRCGEN1_XATSLIB_PY)
srcgen1_xatslib:: ; $(CAT) \
$(SRCGEN1_XATSLIBD)/libcats/DATS/CATS/PY/libcats.cats >> $(SRCGEN1_XATSLIB_PY)
#
##################################################################
##################################################################
# end-of
# [ATS3-XANADU/srcgen2/xats2py/srcgen1/xshared/runtime/Makefile]
##################################################################
##################################################################
