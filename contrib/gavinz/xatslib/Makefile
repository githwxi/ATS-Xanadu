CAT=cat
ECHO=echo
BUN=bun
NODE=node

XATS2JS=$(XATSHOME)/srcgen2/xats2js/srcgenx/UTIL/xats2js_jsemit00_dats.js
SRCGEN2_XSHARED=$(XATSHOME)/srcgen2/xats2js/srcgenx/xshared/runtime

# Directories
DATS_DIR := DATS
DATS_JS_DIR := $(DATS_DIR)/JS
CATS_DIR := CATS
BUILD_DIR := BUILD
BUILD_JS_DIR := $(BUILD_DIR)/JS

# Find all .dats files and generate corresponding .js filenames
DATS_FILES    := $(wildcard $(DATS_DIR)/*.dats)
DATS_JS_FILES := $(wildcard $(DATS_DIR)/JS/*.dats)
CATS_JS_FILES := $(wildcard $(CATS_DIR)/JS/*.cats)

JS_OUTPUTS := $(patsubst $(DATS_DIR)/%.dats,$(BUILD_JS_DIR)/%_dats.js,$(DATS_FILES)) \
						  $(patsubst $(DATS_JS_DIR)/%.dats,$(BUILD_JS_DIR)/JS/%_dats.js,$(DATS_JS_FILES))

# Main target to build all files
all: builddir xatslib

# Make sure build directory exists
builddir:
	mkdir -pv $(BUILD_DIR)
	mkdir -pv $(BUILD_JS_DIR)
	mkdir -pv $(BUILD_JS_DIR)/JS

# Rule to compile .dats to .js
$(BUILD_JS_DIR)/%_dats.js: $(DATS_DIR)/%.dats
	$(BUN) run $(XATS2JS) $< > $@

$(BUILD_JS_DIR)/JS/%_dats.js: $(DATS_DIR)/JS/%.dats
	$(BUN) run $(XATS2JS) $< > $@

# Group all JS files into one runnable file
xatslib: $(CATS_JS_FILES) $(JS_OUTPUTS)
	$(ECHO) "// gavinz/xatslib generated on " `date` > $(BUILD_DIR)/xatslib.js
	$(CAT) $^ >> $(BUILD_DIR)/xatslib.js

# Clean target
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
