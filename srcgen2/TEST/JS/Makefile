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
XSHARED="${XATSJSD}/xshared"
XATS2JS="${XATSJSD}/bin/xats2js"
######
XATSJSD=\
"../../../srcgen1/xats2js/srcgenx"
######
LIBXATSOPT_JS="./../../lib/libxatsopt.js"
######
XATS2JS_PRELUDE="$(XSHARED)/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE="$(XSHARED)/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE="$(XSHARED)/runtime/xats2js_xatslib_node.js"
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
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test02_lexing0
test02_lexing0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test03_xstamp0
test03_xstamp0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test04_xsymbol
test04_xsymbol:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test05_filpath
test05_filpath:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test06_locinfo
test06_locinfo:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test07_lexbuf0
test07_lexbuf0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test08_lexing0
test08_lexing0:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test09_parsing
test09_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test10_parsing
test10_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test11_parsing
test11_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test12_parsing
test12_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test13_parsing
test13_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test14_parsing
test14_parsing:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test15_trans01
test15_trans01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test16_trans01
test16_trans01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test17_tread01
test17_tread01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test18_tread01
test18_tread01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test19_tread01
test19_tread01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test20_trans12
test20_trans12:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test21_trans12
test21_trans12:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test22_tread12
test22_tread12:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test23_trans2a
test23_trans2a:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test24_tread22
test24_tread22:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test25_tread23
test25_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test26_tread23
test26_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test27_tread23
test27_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test28_tread23
test28_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test29_tread23
test29_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test30_tread23
test30_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test31_tread23
test31_tread23:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test32_xatsopt
test32_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test33_xatsopt
test33_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test34_xatsopt
test34_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test35_xatsopt
test35_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test36_xatsopt
test36_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test37_xatsopt
test37_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test38_xatsopt
test38_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test39_xatsopt
test39_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test40_xatsopt
test40_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test41_xatsopt
test41_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test42_xatsopt
test42_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test43_xatsopt
test43_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test44_xatsopt
test44_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test45_xatsopt
test45_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test46_xatsopt
test46_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test47_xatsopt
test47_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test48_xatsopt
test48_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js
#
######
#
test:: \
test49_xatsopt
test49_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js ./DATA/trtmp3b_004.dats
#
######
#
test:: \
test50_xatsopt
test50_xatsopt:: ; \
$(CAT) $(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js ./DATA/trtmp3c_001.dats
#
######
#
test:: \
test51_xatsopt
test51_xatsopt:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js ./DATA/trans34_001.dats
#
######
#
test:: \
test52_xatsopt
test52_xatsopt:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $@_dats.js && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $@_dats.js && \
$(CAT) \
$(XATS2JS_XATSLIB_NODE) >> $@_dats.js && \
$(CAT) $(LIBXATSOPT_JS) >> $@_dats.js && \
$(XATS2JS) --output-a $@_dats.js -d ./$@.dats && $(NODE) ./$@_dats.js ./DATA/trans34_002.dats
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
