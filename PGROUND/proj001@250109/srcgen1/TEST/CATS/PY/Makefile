########################################################################
########################################################################
# Makefile for PY-emission
########################################################################
########################################################################
CAT=cat
ECHO=echo
NODE=node
PYT3=python3
########################################################################
########################################################################
all:: test00
all:: test01
########################################################################
########################################################################
testall:: test00; $(PYT3) $<_out.py
testall:: test01; $(PYT3) $<_out.py
########################################################################
########################################################################
test00:: ; \
echo "##" `date` > $@_out.py
############
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2py_py1emit.py >> $@_out.py
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2py_prelude.py >> $@_out.py
test00:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2py_xatslib.py >> $@_out.py
############
test00:: test00.dats; \
$(NODE) --stack-size=8192 $(SRCGEN2_XATS2PY) $< >> $@_out.py
########################################################################
########################################################################
test01:: ; \
echo "##" `date` > $@_out.py
############
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2py_py1emit.py >> $@_out.py
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2py_prelude.py >> $@_out.py
test01:: ; \
$(CAT) $(SRCGEN2_XSHARED)/xats2py_xatslib.py >> $@_out.py
############
test01:: test01_misc001.dats; \
$(NODE) --stack-size=8192 $(SRCGEN2_XATS2PY) $< >> $@_out.py
########################################################################
########################################################################
clean:: ; rm -f *~
cleanall:: ; rm -f *~
cleanall:: ; rm -f test??_out.py
########################################################################
########################################################################
SRCGEN2_SRCGENX=\
$(XATSHOME)/srcgen2/xats2py/srcgenx
SRCGEN2_XSHARED=\
$(XATSHOME)/srcgen2/xats2py/srcgenx/xshared/runtime
SRCGEN2_XATS2PY=\
$(XATSHOME)/srcgen2/xats2py/srcgenx/UTIL/xats2py_pyemit00_dats.js
SRCGEN2_XATS2PY=\
$(XATSHOME)/srcgen2/xats2py/srcgenx/UTIL/xats2py_pyemit00_dats_out.js
########################################################################
###################### end of [Makefile_pyemit] ########################
