C_COMPILER=gcc
C_FLAGS=-pg -ggdb -save-temps -dumpdir build/intermediary/

PACKAGE_FOLDER=packages
BUILD_FOLDER=build
SRC_FOLDER=src

OUTPUT_FILE=test

default: build
.PHONY: default

# --- String -------------------
String_PACKAGE_FOLDER=$(PACKAGE_FOLDER)/String
String_PACKAGE_BUILD_FOLDER=$(BUILD_FOLDER)/String
String_PACKAGE_C=create.c modify.c string.c

String_PACKAGE_C_FILES=$(foreach C_FILE,$(String_PACKAGE_C),$(String_PACKAGE_FOLDER)/$(C_FILE))
String_PACKAGE_O_FILES=$(foreach O_FILE,$(String_PACKAGE_C),$(String_PACKAGE_BUILD_FOLDER)/$(O_FILE).o)

O_FILE_LIST+=$(String_PACKAGE_O_FILES)

String_INCLUDE_FOLDERS+=$(String_PACKAGE_FOLDER)

String_INCLUDE=$(foreach FOLDER,$(String_INCLUDE_FOLDERS),-I$(FOLDER))

# How to build String
$(String_PACKAGE_BUILD_FOLDER)/%.c.o: $(String_PACKAGE_FOLDER)/%.c
	$(C_COMPILER) $(C_FLAGS) $(String_INCLUDE) -c -o $@ $<

# --- Base -------------------
BASE_FOLDER=$(SRC_FOLDER)
BASE_BUILD_FOLDER=$(BUILD_FOLDER)/$(SRC_FOLDER)
BASE_C=main.c

BASE_C_FILES=$(foreach C_FILE,$(BASE_C),$(BASE_FOLDER)/$(C_FILE))
BASE_O_FILES=$(foreach C_FILE,$(BASE_C),$(BASE_BUILD_FOLDER)/$(C_FILE).o)

O_FILE_LIST+=$(BASE_O_FILES)

BASE_INCLUDE_FOLDERS+=$(PACKAGE_FOLDER)
BASE_INCLUDE_FOLDERS+=$(BASE_FOLDER)

BASE_INCLUDE=$(foreach FOLDER,$(BASE_INCLUDE_FOLDERS),-I$(FOLDER))

# How to build base
$(BASE_BUILD_FOLDER)/%.c.o: $(BASE_FOLDER)/%.c
	$(C_COMPILER) $(C_FLAGS) $(BASE_INCLUDE) -c -o $@ $<

# -----------------------------------------------------

build: build_folders $(BUILD_FOLDER)/$(OUTPUT_FILE)
.PHONY: build

build_folders:
	mkdir -p $(BASE_BUILD_FOLDER)
	mkdir -p $(String_PACKAGE_BUILD_FOLDER)
	mkdir -p $(BUILD_FOLDER)/intermediary
.PHONY: build_folders

clean:
	rm -rf $(O_FILE_LIST)
	rm -rf $(BUILD_FOLDER)/$(OUTPUT_FILE)
.PHONY: clean

run: $(BUILD_FOLDER)/$(OUTPUT_FILE)
	@echo
	$(BUILD_FOLDER)/$(OUTPUT_FILE)
.PHONY: run

$(BUILD_FOLDER)/$(OUTPUT_FILE): $(O_FILE_LIST)
	$(C_COMPILER) $(C_FLAGS) $(O_FILE_LIST) -o $(BUILD_FOLDER)/$(OUTPUT_FILE)