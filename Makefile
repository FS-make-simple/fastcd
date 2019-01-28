#code by phoneli

.PHONY : all clean
TARGETS = fcd
all : $(TARGETS)

LIB = -pthread -lncurses
CFLAGS = -Wall

CC = g++ $(CFLAGS)

#make r=0 | make r=1
r = 0
ifeq ($(r),0)
	# debug
	CFLAGS += -g
else
	# release
	#CFLAGS += -static -O3 -DNDEBUG
	CFLAGS += -O3 -DNDEBUG
endif

$(TARGETS): 
	$(CC) $@.cpp -o $@ $(LIB)

#Tool command
clean:
	-rm -rf $(TARGETS) ./tmp/*
