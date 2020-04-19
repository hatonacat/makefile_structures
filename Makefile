BIN_DIR = ./bin
INC_DIR = ./include
OBJ_DIR = ./obj
SRC_DIR = ./src

DEPS = print.h
SRC_FILES = main.c print.c

EXECUTABLE_NAME = main

# MODIFY ABOVE ONLY =========================

# Selective search variables
vpath %.h $(INC_DIR)
vpath %.o $(BIN_DIR)
vpath %.c $(SRC_DIR)

# Compilation variables
CFLAGS = -I$(INC_DIR)
OUTPUT_OPTION = -o $(OBJ_DIR)/$@

# File generation
EXECUTABLE = $(EXECUTABLE_NAME:%=$(BIN_DIR)/%)
OBJ_FILES = $(SRC_FILES:%.c=$(OBJ_DIR)/%.o)

$(EXECUTABLE): $(OBJ_FILES)
	cc -o $@ $(OBJ_FILES)

$(OBJ_DIR)/%.o: %.c $(DEPS) | $(OBJ_DIR)
	$(CC) -c $< -o $@ $(CFLAGS)
 
$(OBJ_DIR):
	mkdir $(OBJ_DIR)

.PHONY: build clean
build:
	$(EXECUTABLE)
clean:
	rm $(OBJ_DIR) -r $(EXECUTABLE)