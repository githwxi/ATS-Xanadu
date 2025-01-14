CAT=cat
ECHO=echo
BUN=bun
NODE=node

XATS2JS=$(XATSHOME)/srcgen2/xats2js/srcgenx/UTIL/xats2js_jsemit00_dats.js
SRCGEN2_XSHARED=$(XATSHOME)/srcgen2/xats2js/srcgenx/xshared/runtime

# Directories
DATS_DIR := DATS
BUILD_DIR := BUILD/JS

# Find all .dats files and generate corresponding .js filenames
DATS_FILES := $(wildcard $(DATS_DIR)/*.dats)
JS_FILES := $(patsubst $(DATS_DIR)/%.dats,$(BUILD_DIR)/%_dats.js,$(DATS_FILES))
MAIN := $(BUILD_DIR)/main.js

# Main target to build all files
all: $(BUILD_DIR) $(JS_FILES)

# Make sure build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to compile .dats to .js
$(BUILD_DIR)/%_dats.js: $(DATS_DIR)/%.dats
	$(BUN) run $(XATS2JS) $< > $@

# Group all JS files into one runnable file
$(MAIN): $(JS_FILES)
	$(ECHO) "// " `date` > $@
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_js1emit.js >> $@
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude.js >> $@
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_xatslib.js >> $@
	$(CAT) $(SRCGEN2_XSHARED)/xats2js_prelude_node.js >> $@
	$(CAT) $< >> $@

run: $(MAIN)
	$(BUN) run $(MAIN)

# Clean target
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean run
