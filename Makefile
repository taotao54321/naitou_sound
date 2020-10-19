.PHONY: all clean

CA65 := ca65
LD65 := ld65

TARGET := naitou_sound.nes
DBG    := naitou_sound.dbg

CFG  := naitou_sound.cfg
OBJS := prg.o chr.o

all: $(TARGET)

$(TARGET): $(CFG) $(OBJS)
	$(LD65) --config $(CFG) --dbgfile $(DBG) -o $@ $(OBJS)

%.o: %.s65
	$(CA65) --debug-info $<

clean:
	-$(RM) $(TARGET) $(OBJS)
