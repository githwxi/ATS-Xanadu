######
#
# HX-2022-07-08:
#
# For testing
# ATS3/XANADU/
# xatslib/haskell/monoid0
#
######
CAT=cat
CPF=cp -f
ECHO=echo
NODE=node
######
MYTEST="."
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
#
test:: \
test01_monoid0
test01_monoid0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test01_monoid0_dats.js
#
######
#
test:: \
test02_functor
test02_functor:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test02_functor_dats.js
#
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f test??_*_dats.js
######
############ end of [Makefile] ############
