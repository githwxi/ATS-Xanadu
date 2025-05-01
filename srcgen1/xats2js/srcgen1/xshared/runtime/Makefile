########################################################################
########################################################################
#
# For xats2js/prelude
#
########################################################################
########################################################################
CAT=cat
CPF=cp -f
ECHO=echo
PRINTF=printf
########################################################################
SRCGEN1=./../../../../.
XATS2JS="./../../bin/xats2js"
########################################################################
########################################################################
all::
all:: ; \
echo "Please do 'make xats2js_js1emit'!"
all:: ; \
echo "Please do 'make xats2js_prelude'!"
all:: ; \
echo "Please do 'make xats2js_prelude_node'!"
all:: ; \
echo "Please do 'make xats2js_xatslib_node'!"
########################################################################
########################################################################
#
xats2js_js1emit:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// XATS2JS_JS1EMIT\n" >> $@.js \
&& \
$(PRINTF) \
"/* ****** ****** */\n" >> $@.js \
&& \
$(PRINTF) "'use strict';\n" >> $@.js
#
xats2js_js1emit:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/runtime.cats >> $@.js
#
########################################################################
########################################################################
#
xats2js_prelude:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// XATS2JS_PRELUDE\n" >> $@.js \
&& \
$(PRINTF) \
"/* ****** ****** */\n" >> $@.js \
&& \
$(PRINTF) "'use strict';\n" >> $@.js
#
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics0.cats >> $@.js
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics1.cats >> $@.js
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics2.cats >> $@.js
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics3.cats >> $@.js
#
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/g_eqref.cats >> $@.js
#
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/g_print.cats >> $@.js
#
xats2js_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/xatsopt.cats >> $@.js
#
########################################################################
########################################################################
#
xats2js_prelude_node:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// XATS2JS_PRELUDE_NODE\n" >> $@.js \
&& \
$(PRINTF) "/* ****** ****** */\n" >> $@.js
#
xats2js_prelude_node:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/NODE/g_print.cats >> $@.js
#
xats2js_prelude_node:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/NODE/process.cats >> $@.js
#
xats2js_prelude_node:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/NODE/xatsopt.cats >> $@.js
#
########################################################################
########################################################################
#
xats2js_xatslib_node:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// XATS2JS_XATSLIB_NODE\n" >> $@.js \
&& \
$(PRINTF) "/* ****** ****** */\n" >> $@.js
#
xats2js_xatslib_node:: ; \
$(CAT) $(SRCGEN1)/xatslib/githwxi/DATS/CATS/JS/NODE/basics0.cats >> $@.js
#
########################################################################
clean:: ; rm -f *~
########################################################################
cleanall:: clean
# cleanall:: ; rm -f xats2js_js1emit.js
# cleanall:: ; rm -f xats2js_prelude.js
# cleanall:: ; rm -f xats2js_prelude_node.js
# cleanall:: ; rm -f xats2js_xatslib_node.js
########################################################################
########################################################################
# end-of-[ATS-Xanadu/srcgen1/xats2js/srcgen1/xshared/runtime/Makefile]
########################################################################
########################################################################
