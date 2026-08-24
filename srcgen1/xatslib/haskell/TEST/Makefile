########################################################################
#
# HX-2022-07-08:
#
# For testing
# ATS3/XANADU/
# xatslib/haskell/monoid0
#
########################################################################
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
XATS2JS_JS1EMIT=\
"$(XSHARED)/runtime/xats2js_js1emit.js"
SRCGEN1_PRELUDE=\
"$(XSHARED)/runtime/srcgen1_prelude.js"
SRCGEN1_PRECATS=\
"$(XSHARED)/runtime/srcgen1_precats.js"
SRCGEN1_PRELUDE_NODE=\
"$(XSHARED)/runtime/srcgen1_prelude_node.js"
SRCGEN1_XATSLIB_NODE=\
"$(XSHARED)/runtime/srcgen1_xatslib_node.js"
########################################################################
all:: test
test:: ; $(XATS2JS)
########################################################################
#
test:: \
test01_monoid0
test01_monoid0:: ; \
$(CAT) $(XATS2JS_JS1EMIT) > OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_PRELUDE) >> OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_PRECATS) >> OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_PRELUDE_NODE) >> OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_XATSLIB_NODE) >> OUTS/$@_dats.js && \
$(XATS2JS) --output-a OUTS/$@_dats.js -d ./$@.dats && $(NODE) OUTS/test01_monoid0_dats.js
#
########################################################################
#
test:: \
test02_functor
test02_functor:: ; \
$(CAT) $(XATS2JS_JS1EMIT) > OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_PRELUDE) >> OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_PRECATS) >> OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_PRELUDE_NODE) >> OUTS/$@_dats.js && \
$(CAT) $(SRCGEN1_XATSLIB_NODE) >> OUTS/$@_dats.js && \
$(XATS2JS) --output-a OUTS/$@_dats.js -d ./$@.dats && $(NODE) OUTS/test02_functor_dats.js
#
########################################################################
#
# HX: for cleaning up
#
########################################################################
clean:: ; rm -f *~
########################################################################
cleanall:: clean
cleanall:: ; rm -f OUTS/test??_*_dats.js
########################################################################
###########################(end-of[Makefile])###########################
########################################################################
