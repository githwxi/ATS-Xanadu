######
#
# HX-2022-06-06:
# For testing ATS3/XATSOPT
#
######
CAT=cat
CPF=cp -f
ECHO=echo
NODE=node
NODE=node --stack-size=16000
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
test01_xbasics
test01_xbasics:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test01_xbasics_dats.js
#
######
#
test:: \
test02_lexing0
test02_lexing0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test02_lexing0_dats.js
#
######
#
test:: \
test03_xstamp0
test03_xstamp0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test03_xstamp0_dats.js
#
######
#
test:: \
test04_xsymbol
test04_xsymbol:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test04_xsymbol_dats.js
#
######
#
test:: \
test05_filpath
test05_filpath:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test05_filpath_dats.js
#
######
#
test:: \
test06_locinfo
test06_locinfo:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test06_locinfo_dats.js
#
######
#
test:: \
test07_lexbuf0
test07_lexbuf0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test07_lexbuf0_dats.js
#
######
#
test:: \
test08_lexing0
test08_lexing0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test08_lexing0_dats.js
#
######
#
test:: \
test09_parsing
test09_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test09_parsing_dats.js
#
######
#
test:: \
test10_parsing
test10_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test10_parsing_dats.js
#
######
#
test:: \
test11_parsing
test11_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test11_parsing_dats.js
#
######
#
test:: \
test12_parsing
test12_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test12_parsing_dats.js
#
######
#
test:: \
test13_parsing
test13_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test13_parsing_dats.js
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
