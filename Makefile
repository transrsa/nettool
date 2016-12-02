
################ PATH ################
INCLUDE_PATH=		./src/
SOURCE_PATH=		./src/
OUTPUT_PATH=		./
C_INCLUDE_PATH= 	../../include

################ TARGET-NAME ################
TARGET=			$(OUTPUT_PATH)mknxb

################ TOOL ################
CROSS_COMPILE= 	
CC=			$(CROSS_COMPILE)gcc
STRIP=			$(CROSS_COMPILE)strip

################ FLAGS ################
CFLAGS=			-D__LP64__ -m64 -g -Wall -DDEBUG -O0 -I./ -I$(INCLUDE_PATH) -I$(C_INCLUDE_PATH) -c $< -o $@
LFLAGS= 		-m64 -o $@ -D_REENTRANT -Wl,--build-id=none

################ OBJECTS ################
OBJ=			mknxb_main.o

################ TARGET ################
x64: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(LFLAGS) $(OBJ)
	$(STRIP) $@
	rm -f *.o

################ PROGRAM ################
%.o : $(SOURCE_PATH)%.c
	$(CC) $(CFLAGS)

################ CLEAN ################
clean:
	-rm -f *.o $(TARGET)

################ REMOVE-BACKUP ################
rmbak:
	-rm -f $(INCLUDE_PATH)*.BAK $(SOURCE_PATH)*.BAK
