########################################################################
########################################################################
# Makefile for JS-emission
########################################################################
########################################################################
CAT=cat
ECHO=echo
NODE=node
########################################################################
########################################################################
all:: test00
all:: test01
########################################################################
########################################################################
testall:: test00; $(NODE) $<_out.js
testall:: test01; $(NODE) $<_out.js
########################################################################
########################################################################
test00:: ; \
echo "//" `date` > $@_out.js
############
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_js1emit.js >> $@_out.js
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude.js >> $@_out.js
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_xatslib.js >> $@_out.js
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude_node.js >> $@_out.js
############
test00:: test00.dats; \
$(NODE) --stack-size=4096 $(SRCGEN2_XATS2JS) $< >> $@_out.js
########################################################################
########################################################################
test01:: ; \
echo "//" `date` > $@_out.js
############
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_js1emit.js >> $@_out.js
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude.js >> $@_out.js
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_xatslib.js >> $@_out.js
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude_node.js >> $@_out.js
############
test01:: test01_misc001.dats; \
$(NODE) --stack-size=4096 $(SRCGEN2_XATS2JS) $< >> $@_out.js
########################################################################
########################################################################
clean:: ; rm -f *~
cleanall:: ; rm -f *~
cleanall:: ; rm -f test??_out.js
cleanall:: ; rm -f test??_out?.js
########################################################################
########################################################################
SRCGEN2_SRCGENX=\
$(XATSHOME)/srcgen2/xats2js/srcgenx
SRCGEN2_XSHARED=\
$(XATSHOME)/srcgen2/xats2js/srcgenx/xshared/runtime
SRCGEN2_XATS2JS=\
$(XATSHOME)/srcgen2/xats2js/srcgenx/UTIL/xats2js_jsemit00_dats.js
########################################################################
###################### end of [Makefile_jsemit] ########################
