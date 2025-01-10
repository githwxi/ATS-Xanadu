###############################################################
###############################################################
# beg of [Makefile]
###############################################################
###############################################################
CAT=cat
###############################################################
PRELUDED=$(XATSHOME)/prelude
XATSLIBD=$(XATSHOME)/xatslib
###############################################################
PRELUDE_PY=xats2py_prelude.py
XATSLIB_PY=xats2py_xatslib.py
###############################################################
all::
###############################################################
all:: prelude
all:: xatslib
###############################################################
prelude:: ; \
echo "##" `date` > $(PRELUDE_PY)
prelude:: ; \
$(CAT) xats2py_prelude_hd >> $(PRELUDE_PY)
###############################################################
prelude:: \
xtop000
xtop000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/xtop000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
gbas000
gbas000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gbas000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
gdbg000
gdbg000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gdbg000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
gint000
gint000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gint000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
bool000
bool000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/bool000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
char000
char000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/char000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
gflt000
gflt000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/gflt000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
strn000
strn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/strn000.cats >> $(PRELUDE_PY)
###############################################################
prelude:: \
axrf000
axrf000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/axrf000.cats >> $(PRELUDE_PY)
prelude:: \
axsz000
axsz000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/PY/axsz000.cats >> $(PRELUDE_PY)
###############################################################
###############################################################
xatslib:: ; \
echo "##" `date` > $(XATSLIB_PY)
xatslib:: ; \
$(CAT) xats2py_xatslib_hd >> $(XATSLIB_PY)
###############################################################
xatslib:: \
Array00
Array00: ; \
$(CAT) $(XATSLIBD)/DATS/CATS/PY/Array00.cats >> $(XATSLIB_PY)
###############################################################
xatslib:: \
Hsmap00
Hsmap00: ; \
$(CAT) $(XATSLIBD)/DATS/CATS/PY/Hsmap00.cats >> $(XATSLIB_PY)
###############################################################
###############################################################
# end of [Makefile]
###############################################################
###############################################################
