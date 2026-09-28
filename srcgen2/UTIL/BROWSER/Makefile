########################################################################

PYTHON ?= python3

########################################################################

.PHONY:: all
.PHONY:: build

########################################################################

all: index.html

########################################################################

# Rebuild unconditionally,
# even when index.html is up to date.
build: prelude/index.html; $(PYTHON) ./build.py

########################################################################

index.html: \
build.py template.html app.js compiler-worker.js \
prelude/index.html xassets/xatsopt_tcheck01_ats2_opt1.js
	$(PYTHON) ./build.py

prelude/index.html: ; $(MAKE) -C prelude PYTHON="$(PYTHON)"

########################################################################
