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
NODE=node --stack-size=4096
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
test:: \
test14_parsing
test14_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test14_parsing_dats.js
#
######
#
test:: \
test15_trans01
test15_trans01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test15_trans01_dats.js
#
######
#
test:: \
test16_trans01
test16_trans01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test16_trans01_dats.js
#
######
#
test:: \
test17_tread01
test17_tread01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test17_tread01_dats.js
#
######
#
test:: \
test18_tread01
test18_tread01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test18_tread01_dats.js
#
######
#
test:: \
test19_tread01
test19_tread01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test19_tread01_dats.js
#
######
#
test:: \
test20_trans12
test20_trans12:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test20_trans12_dats.js
#
######
#
test:: \
test21_trans12
test21_trans12:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test21_trans12_dats.js
#
######
#
test:: \
test22_tread12
test22_tread12:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test22_tread12_dats.js
#
######
#
test:: \
test23_trans2a
test23_trans2a:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test23_trans2a_dats.js
#
######
#
test:: \
test24_tread22
test24_tread22:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test24_tread22_dats.js
#
######
#
test:: \
test25_tread23
test25_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test25_tread23_dats.js
#
######
#
test:: \
test26_tread23
test26_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test26_tread23_dats.js
#
######
#
test:: \
test27_tread23
test27_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test27_tread23_dats.js
#
######
#
test:: \
test28_tread23
test28_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test28_tread23_dats.js
#
######
#
test:: \
test29_tread23
test29_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test29_tread23_dats.js
#
######
#
test:: \
test30_tread23
test30_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test30_tread23_dats.js
#
######
#
test:: \
test31_tread23
test31_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test31_tread23_dats.js
#
######
#
test:: \
test32_xatsopt
test32_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test32_xatsopt_dats.js
#
######
#
test:: \
test33_xatsopt
test33_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test33_xatsopt_dats.js
#
######
#
test:: \
test34_xatsopt
test34_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test34_xatsopt_dats.js
#
######
#
test:: \
test35_xatsopt
test35_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test35_xatsopt_dats.js
#
######
#
test:: \
test36_xatsopt
test36_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test36_xatsopt_dats.js
#
######
#
test:: \
test37_xatsopt
test37_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test37_xatsopt_dats.js
#
######
#
test:: \
test38_xatsopt
test38_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test38_xatsopt_dats.js
#
######
#
test:: \
test39_xatsopt
test39_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test39_xatsopt_dats.js
#
######
#
test:: \
test40_xatsopt
test40_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) test40_xatsopt_dats.js
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
