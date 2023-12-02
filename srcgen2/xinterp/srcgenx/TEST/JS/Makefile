######
#
# HX-2023-11-29:
# Wed Nov 29 15:10:22 EST 2023
#
######
CAT=cat
CPF=cp -f
ECHO=echo
NODE=node
NODE=node --stack-size=4096
######
XSHARED="${XATS2JSD}/xshared"
XATS2JS="${XATS2JSD}/bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(XSHARED)/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(XSHARED)/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE=\
"$(XSHARED)/runtime/xats2js_xatslib_node.js"
######
all:: test
######
test:: ; $(XATS2JS)
######
######
#
test:: \
xatsopt_boot01
xatsopt_boot01:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSOPT_OBJDATS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js --dynamic $@.dats
#
######
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f ./xatsopt_boot??_dats.js
cleanall:: ; rm -f ./xatsopt_test??_dats.js
######
########################### end of [Makefile] ###########################
