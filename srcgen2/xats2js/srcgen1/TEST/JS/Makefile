######
#
# HX-2024-03-25:
# Mon 25 Mar 2024 06:06:29 PM EDT
# The compiler is srcgen1/xats2js
#
######
CAT=cat
CPF=cp -f
ECHO=echo
NODE=node
NODE=node \
--stack-size=4096
NODE=node \
--stack-size=4096 \
--max-old-space-size=4096
######
XSHARED=${XATSJSD}/xshared
XATS2JS=${XATSJSD}/bin/xats2js
######
XATSJSD=\
./../../../../../srcgen1/xats2js/srcgenx
######
LIBXATSOPT_JS="./../../../../lib/libxatsopt.js"
######
XATS2JS_PRELUDE="$(XSHARED)/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE="$(XSHARED)/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE="$(XSHARED)/runtime/xats2js_xatslib_node.js"
######
all:: test
######
test:: ; $(XATS2JS)
######
######
#
test:: \
test01_xats2js
test01_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test02_xats2js
test02_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test03_xats2js
test03_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test04_xats2js
test04_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test05_xats2js
test05_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test06_xats2js
test06_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test07_xats2js
test07_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
test:: \
test08_xats2js
test08_xats2js:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f ./test??_xats2js_dats.js
######
########################### end of [Makefile] ###########################
