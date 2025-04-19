########################################################################
########################################################################
# beg of [Makefile]
########################################################################
########################################################################
CAT=cat
ECHO=printf
########################################################################
PRELUDED=$(XATSHOME)/prelude
XATSLIBD=$(XATSHOME)/xatslib
########################################################################
PRELUDE_JS=xats2js_prelude.js
XATSLIB_JS=xats2js_xatslib.js
PRELUDE_NODE_JS=xats2js_prelude_node.js
XATSLIB_NODE_JS=xats2js_xatslib_node.js
########################################################################
all::
########################################################################
all:: prelude
all:: xatslib
all:: prelude_node
########################################################################
prelude:: ; \
$(ECHO) "%s%s\n" \
"// " "`date`" > $(PRELUDE_JS)
prelude:: ; \
$(CAT) xats2js_prelude_hd >> $(PRELUDE_JS)
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
echo "//" `date` > $(XATSLIB_JS)
xatslib:: ; \
$(CAT) xats2js_xatslib_hd >> $(XATSLIB_JS)
########################################################################
xatslib:: \
Array00
Array00: ; \
$(CAT) $(XATSLIBD)/DATS/CATS/JS/Array00.cats >> $(XATSLIB_JS)
########################################################################
xatslib:: \
Hsmap00
Hsmap00: ; \
$(CAT) $(XATSLIBD)/DATS/CATS/JS/Hsmap00.cats >> $(XATSLIB_JS)
########################################################################
########################################################################
prelude_node:: ; \
echo "//" `date` > $(PRELUDE_NODE_JS)
prelude_node:: ; \
$(CAT) xats2js_prelude_node_hd >> $(PRELUDE_NODE_JS)
prelude_node:: ; $(CAT) \
$(PRELUDED)/DATS/CATS/JS/NODE/node000.cats >> $(PRELUDE_NODE_JS)
########################################################################
########################################################################
clean:: ; rm -f *~
########################################################################
cleanall:: clean
# cleanall:: ; rm -f xats2js_js1emit.js
# cleanall:: ; rm -f xats2js_prelude_hd
# cleanall:: ; rm -f xats2js_prelude.js
# cleanall:: ; rm -f xats2js_prelude_node_hd
# cleanall:: ; rm -f xats2js_prelude_node.js
# cleanall:: ; rm -f xats2js_xatslib_node_hd
# cleanall:: ; rm -f xats2js_xatslib_node.js
########################################################################
########################################################################
# end-of-[ATS-Xanadu/srcgen2/xats2js/srcgen1/xshared/runtime/Makefile]
########################################################################
########################################################################
