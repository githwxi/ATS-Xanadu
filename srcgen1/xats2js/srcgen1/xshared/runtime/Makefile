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
########################################################################
MYROOT0=./../../../../.
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
$(ECHO) \
"/* ****** ****** */" > xats2js_js1emit.js \
&& \
$(ECHO) \
"// XATS2JS_JS1EMIT" >> xats2js_js1emit.js \
&& \
$(ECHO) \
"/* ****** ****** */\n" >> xats2js_js1emit.js \
&& \
$(ECHO) "'use strict';\n" >> xats2js_js1emit.js
#
xats2js_js1emit:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/runtime.cats >> xats2js_js1emit.js
#
########################################################################
########################################################################
#
xats2js_prelude:: ; \
$(ECHO) \
"/* ****** ****** */" > xats2js_prelude.js \
&& \
$(ECHO) \
"// XATS2JS_PRELUDE" >> xats2js_prelude.js \
&& \
$(ECHO) \
"/* ****** ****** */\n" >> xats2js_prelude.js \
&& \
$(ECHO) "'use strict';\n" >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/basics0.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/basics1.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/basics2.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/basics3.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/g_eqref.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/g_print.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/xatsopt.cats >> xats2js_prelude.js
#
########################################################################
########################################################################
xats2js_prelude_node:: ; \
$(ECHO) \
"/* ****** ****** */" > xats2js_prelude_node.js \
&& \
$(ECHO) \
"/*\nXATS2JS_PRELUDE_NODE\n*/" >> xats2js_prelude_node.js \
&& \
$(ECHO) "/* ****** ****** */\n" >> xats2js_prelude_node.js
#
xats2js_prelude_node:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/NODE/g_print.cats >> xats2js_prelude_node.js
#
xats2js_prelude_node:: ; \
$(CAT) \
$(MYROOT0)/prelude/DATS/CATS/JS/NODE/process.cats >> xats2js_prelude_node.js
#
########################################################################
########################################################################
xats2js_xatslib_node:: ; \
$(ECHO) \
"/* ****** ****** */" > xats2js_xatslib_node.js \
&& \
$(ECHO) \
"/*\nXATS2JS_XATSLIB_NODE\n*/" >> xats2js_xatslib_node.js \
&& \
$(ECHO) "/* ****** ****** */\n" >> xats2js_xatslib_node.js
#
xats2js_xatslib_node:: ; \
$(CAT) \
$(MYROOT0)/xatslib/githwxi/DATS/CATS/JS/NODE/basics0.cats >> xats2js_xatslib_node.js
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
