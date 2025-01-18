CAT=cat
ECHO=echo
BUN=bun
NODE=node

XATS2JS=$(XATSHOME)/srcgen2/xats2js/srcgenx/UTIL/xats2js_jsemit00_dats.js
SRCGEN2_XSHARED=$(XATSHOME)/srcgen2/xats2js/srcgenx/xshared/runtime
GAVINZ_XATSLIB=$(XATSHOME)/contrib/gavinz/xatslib/BUILD/xatslib.js

# Directories
DATS_DIR := DATS
BUILD_DIR := BUILD
BUILD_JS_DIR := $(BUILD_DIR)/JS

# Find all .dats files and generate corresponding .js filenames
DATS_FILES := $(wildcard $(DATS_DIR)/*.dats)
JS_FILES := $(patsubst $(DATS_DIR)/%.dats,$(BUILD_JS_DIR)/%_dats.js,$(DATS_FILES))
MAIN := $(BUILD_DIR)/main.js

# Main target to build all files
all: builddirs $(JS_FILES)

# Make sure build directory exists
builddirs:
	mkdir -pv $(BUILD_DIR)
	mkdir -pv $(BUILD_JS_DIR)

# Rule to compile .dats to .js
$(BUILD_JS_DIR)/%_dats.js: $(DATS_DIR)/%.dats
	$(BUN) run $(XATS2JS) $< > $@

# Group all JS files into one runnable file
main: $(JS_FILES)
	$(ECHO) "// " `date` > $(MAIN)
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_js1emit.js >> $(MAIN)
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude.js >> $(MAIN)
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_xatslib.js >> $(MAIN)
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude_node.js >> $(MAIN)
	$(CAT) $(GAVINZ_XATSLIB) >> $(MAIN)
	$(CAT) $^ >> $(MAIN)

run: $(MAIN)
	$(BUN) run $(MAIN)

# Clean target
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean run
