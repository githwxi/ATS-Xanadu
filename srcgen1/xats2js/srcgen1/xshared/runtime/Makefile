######
#
# For xats2js/prelude
#
######

CAT=cat
CPF=cp -f
ECHO=echo

######
MYHOME=./../../../../.
######
XATS2JS="./../../bin/xats2js"
######

all:: ; \
echo "Please do 'make xats2js_prelude'!"
all:: ; \
echo "Please do 'make xats2js_prelude_node'!"
all:: ; \
echo "Please do 'make xats2js_xatslib_node'!"

######
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
$(MYHOME)/prelude/DATS/CATS/JS/basics0.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/runtime.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/prelude.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/g_eqref.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/g_print.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/basics1.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/xatsopt.cats >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(XATS2JS) \
--output-a xats2js_prelude.js -d $(MYHOME)/prelude/DATS/CATS/JS/basics0.dats
#
xats2js_prelude:: ; \
$(XATS2JS) \
--output-a xats2js_prelude.js -d $(MYHOME)/prelude/DATS/CATS/JS/basics1.dats
#
xats2js_prelude:: ; \
$(XATS2JS) \
--output-a xats2js_prelude.js -d $(MYHOME)/prelude/DATS/CATS/JS/prelude.dats
#
######
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
$(MYHOME)/prelude/DATS/CATS/JS/NODE/g_print.cats >> xats2js_prelude_node.js
#
xats2js_prelude_node:: ; \
$(CAT) \
$(MYHOME)/prelude/DATS/CATS/JS/NODE/process.cats >> xats2js_prelude_node.js
#
######
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
$(MYHOME)/xatslib/githwxi/DATS/CATS/JS/NODE/basics0.cats >> xats2js_xatslib_node.js
#
######
clean:: ; rm -f *~
######
cleanall:: clean
# cleanall:: ; rm -f xats2js_prelude.js
######
############ end of [Makefile for ATS3/xats2js] ############
