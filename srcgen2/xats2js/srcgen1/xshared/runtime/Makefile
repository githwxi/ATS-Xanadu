########################################################################
########################################################################
# beg of [Makefile]
########################################################################
########################################################################
CAT=cat
PRINTF=printf
########################################################################
PRELUDED=$(XATSHOME)/prelude
XATSLIBD=$(XATSHOME)/xatslib
########################################################################
PRECATS_JS=srcgen2_precats.js
PRELUDE_JS=srcgen2_prelude.js
XATSLIB_JS=srcgen2_xatslib.js
PRELUDE_NODE_JS=srcgen2_prelude_node.js
XATSLIB_NODE_JS=srcgen2_xatslib_node.js
########################################################################
all::
########################################################################
all:: precats
all:: prelude
all:: xatslib
all:: prelude_node
all:: xatslib_node
########################################################################
precats:: ; \
$(PRINTF) "%s%s\n" \
"// " "`date`" > $(PRECATS_JS)
precats:: ; \
$(CAT) srcgen2_precats_hd >> $(PRECATS_JS)
precats:: ; $(CAT) \
$(PRELUDED)/DATS/CATS/JS/OUTS/precats_dats.js >> $(PRECATS_JS)
########################################################################
prelude:: ; \
$(PRINTF) "%s%s\n" \
"// " "`date`" > $(PRELUDE_JS)
prelude:: ; \
$(CAT) srcgen2_prelude_hd >> $(PRELUDE_JS)
########################################################################
prelude:: \
xtop000
xtop000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/xtop000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
gbas000
gbas000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/gbas000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
gdbg000
gdbg000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/gdbg000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
gint000
gint000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/gint000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
bool000
bool000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/bool000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
char000
char000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/char000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
gflt000
gflt000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/gflt000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
strn000
strn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/strn000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
list000
list000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/list000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
optn000
optn000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/optn000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
strm000
strm000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/strm000.cats >> $(PRELUDE_JS)
prelude:: \
strx000
strx000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/strx000.cats >> $(PRELUDE_JS)
########################################################################
prelude:: \
axrf000
axrf000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/axrf000.cats >> $(PRELUDE_JS)
prelude:: \
axsz000
axsz000: ; \
$(CAT) $(PRELUDED)/DATS/CATS/JS/axsz000.cats >> $(PRELUDE_JS)
########################################################################
########################################################################
xatslib:: ; \
$(PRINTF) "%s%s\n" \
"// " "`date`" > $(XATSLIB_JS)
xatslib:: ; \
$(CAT) srcgen2_xatslib_hd >> $(XATSLIB_JS)
########################################################################
xatslib:: \
dynarr0
dynarr0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/JS/dynarr0.cats >> $(XATSLIB_JS)
########################################################################
xatslib:: \
hashmp0
hashmp0: ; $(CAT) \
$(XATSLIBD)/xbasics/DATS/CATS/JS/hashmp0.cats >> $(XATSLIB_JS)
########################################################################
########################################################################
prelude_node:: ; \
$(PRINTF) "%s%s\n" \
"// " "`date`" > $(PRELUDE_NODE_JS)
prelude_node:: ; \
$(CAT) srcgen2_prelude_node_hd >> $(PRELUDE_NODE_JS)
prelude_node:: ; $(CAT) \
$(PRELUDED)/DATS/CATS/JS/NODE/node000.cats >> $(PRELUDE_NODE_JS)
########################################################################
########################################################################
xatslib_node:: ; \
$(PRINTF) "%s%s\n" \
"// " "`date`" > $(XATSLIB_NODE_JS)
xatslib_node:: ; \
$(CAT) srcgen2_xatslib_node_hd >> $(XATSLIB_NODE_JS)
xatslib_node:: ; $(CAT) \
$(XATSLIBD)/libcats/DATS/CATS/JS/NODE/gbas000.cats >> $(XATSLIB_NODE_JS)
########################################################################
########################################################################
clean:: ; rm -f *~
########################################################################
cleanall:: clean
# cleanall:: ; rm -f xats2js_js1emit.js
# cleanall:: ; rm -f srcgen2_precats_hd
# cleanall:: ; rm -f srcgen2_precats.js
# cleanall:: ; rm -f srcgen2_prelude_hd
# cleanall:: ; rm -f srcgen2_prelude.js
# cleanall:: ; rm -f srcgen2_prelude_node_hd
# cleanall:: ; rm -f srcgen2_prelude_node.js
# cleanall:: ; rm -f srcgen2_xatslib_hd
# cleanall:: ; rm -f srcgen2_xatslib.js
# cleanall:: ; rm -f srcgen2_xatslib_node_hd
# cleanall:: ; rm -f srcgen2_xatslib_node.js
########################################################################
########################################################################
# end-of-[ATS-Xanadu/srcgen2/xats2js/srcgen1/xshared/runtime/Makefile]
########################################################################
########################################################################
