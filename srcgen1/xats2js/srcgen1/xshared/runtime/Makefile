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
echo "Please do 'make srcgen1_precats'!"
all:: ; \
echo "Please do 'make srcgen1_prelude'!"
all:: ; \
echo "Please do 'make srcgen1_prelude_node'!"
all:: ; \
echo "Please do 'make srcgen1_xatslib_node'!"
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
srcgen1_precats:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// SRCGEN1_PRECATS\n" >> $@.js \
&& \
$(PRINTF) \
"/* ****** ****** */\n" >> $@.js \
&& \
$(PRINTF) "'use strict';\n" >> $@.js
#
srcgen1_precats:: ; $(CAT) \
$(SRCGEN1)/prelude/DATS/CATS/JS/OUTS/precats_dats.js >> $@.js
#
########################################################################
########################################################################
#
srcgen1_prelude:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// SRCGEN1_PRELUDE\n" >> $@.js \
&& \
$(PRINTF) \
"/* ****** ****** */\n" >> $@.js \
&& \
$(PRINTF) "'use strict';\n" >> $@.js
#
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics0.cats >> $@.js
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics1.cats >> $@.js
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics2.cats >> $@.js
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/basics3.cats >> $@.js
#
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/g_eqref.cats >> $@.js
#
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/g_print.cats >> $@.js
#
srcgen1_prelude:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/xatsopt.cats >> $@.js
#
########################################################################
########################################################################
#
srcgen1_prelude_node:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// SRCGEN1_PRELUDE_NODE\n" >> $@.js \
&& \
$(PRINTF) "/* ****** ****** */\n" >> $@.js
#
srcgen1_prelude_node:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/NODE/g_print.cats >> $@.js
#
srcgen1_prelude_node:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/NODE/process.cats >> $@.js
#
srcgen1_prelude_node:: ; \
$(CAT) $(SRCGEN1)/prelude/DATS/CATS/JS/NODE/xatsopt.cats >> $@.js
#
########################################################################
########################################################################
#
srcgen1_xatslib_node:: ; \
$(PRINTF) \
"/* ****** ****** */\n" > $@.js \
&& \
$(PRINTF) \
"// SRCGEN1_XATSLIB_NODE\n" >> $@.js \
&& \
$(PRINTF) "/* ****** ****** */\n" >> $@.js
#
srcgen1_xatslib_node:: ; \
$(CAT) $(SRCGEN1)/xatslib/githwxi/DATS/CATS/JS/NODE/basics0.cats >> $@.js
#
########################################################################
clean:: ; rm -f *~
########################################################################
cleanall:: clean
# cleanall:: ; rm -f xats2js_js1emit.js
# cleanall:: ; rm -f srcgen1_precats.js
# cleanall:: ; rm -f srcgen1_prelude.js
# cleanall:: ; rm -f srcgen1_prelude_node.js
# cleanall:: ; rm -f srcgen1_xatslib_node.js
########################################################################
########################################################################
# end-of-[ATS-Xanadu/srcgen1/xats2js/srcgen1/xshared/runtime/Makefile]
########################################################################
########################################################################
