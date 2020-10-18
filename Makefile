.PHONY: all clean

CA65 := ca65
LD65 := ld65

TARGET := naitou_sound.nes

CFG  := naitou_sound.cfg
OBJS := prg.o chr.o

all: $(TARGET)

$(TARGET): $(CFG) $(OBJS)
	$(LD65) --config $(CFG) -o $@ $(OBJS)

%.o: %.s65
	$(CA65) $<

clean:
	-$(RM) $(TARGET) $(OBJS)
