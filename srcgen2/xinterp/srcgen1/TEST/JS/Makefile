############################################################
#
# HX-2023-11-29:
# Wed Nov 29 15:10:22 EST 2023
# The compiler is srcgen1/xats2js
#
############################################################
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
############################################################
LIBXATSOPT_JS="./../../../../lib/lib1xatsopt.js"
############################################################
XATS2JS_JS1EMIT="$(XSHARED)/runtime/xats2js_js1emit.js"
SRCGEN1_PRELUDE="$(XSHARED)/runtime/srcgen1_prelude.js"
SRCGEN1_PRELUDE_NODE="$(XSHARED)/runtime/srcgen1_prelude_node.js"
SRCGEN1_XATSLIB_NODE="$(XSHARED)/runtime/srcgen1_xatslib_node.js"
############################################################
############################################################
all:: test
############################################################
test:: test01
test:: test02
test:: test03
test:: test04
############################################################
############################################################
#
test01: \
test01_xinterp
test01_xinterp:: ; \
$(CAT) \
$(XATS2JS_JS1EMIT) > OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE_NODE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_XATSLIB_NODE) >> OUTS/$@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> OUTS/$@_dats.js && \
$(XATS2JS) --output-a OUTS/$@_dats.js --dynamic $@.dats
#
############################################################
#
test02: \
test02_xinterp
test02_xinterp:: ; \
$(CAT) \
$(XATS2JS_JS1EMIT) > OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE_NODE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_XATSLIB_NODE) >> OUTS/$@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> OUTS/$@_dats.js && \
$(XATS2JS) --output-a OUTS/$@_dats.js --dynamic $@.dats
#
############################################################
#
test03: \
test03_xinterp
test03_xinterp:: ; \
$(CAT) \
$(XATS2JS_JS1EMIT) > OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE_NODE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_XATSLIB_NODE) >> OUTS/$@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> OUTS/$@_dats.js && \
$(XATS2JS) --output-a OUTS/$@_dats.js --dynamic $@.dats
#
############################################################
#
test04: \
test04_xinterp
test04_xinterp:: ; \
$(CAT) \
$(XATS2JS_JS1EMIT) > OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_PRELUDE_NODE) >> OUTS/$@_dats.js && \
$(CAT) \
$(SRCGEN1_XATSLIB_NODE) >> OUTS/$@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> OUTS/$@_dats.js && \
$(XATS2JS) --output-a OUTS/$@_dats.js --dynamic $@.dats
#
############################################################
############################################################
#
# HX: for cleaning up
#
############################################################
clean:: ; rm -f *~
############################################################
cleanall:: clean
cleanall:: ; rm -f ./OUTS/test??_xinterp_dats.js
############################################################
######################end-of(Makefile)######################
