########################################################################

PYTHON ?= python3

########################################################################

.PHONY:: all
.PHONY:: build

########################################################################

all: index.html

########################################################################
#
clean:: ; rm -f *~
#
cleanall:: clean
cleanall:: ; rm -f index.html
#
########################################################################

# Rebuild unconditionally,
# even when index.html is up to date.
build: prelude/index.html; $(PYTHON) ./build.py

########################################################################
#
index.html: \
build.py \
template.html \
prelude/index.html \
app.js compiler-worker.js \
xassets/xatsopt_tcheck01_ats2_opt1.js; $(PYTHON) ./build.py
#
########################################################################

prelude/index.html: ; (cd ./prelude && $(MAKE) PYTHON="$(PYTHON)")

########################################################################
