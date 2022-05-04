VERILOG = iverilog
TARGET = BCD_to_7segm.vcd
TEMP = temp.vvp
$(TARGET) : $(TEMP)
	vvp $(TEMP)
$(TEMP): BCD_to7segm_tb.v BCD_to7segm.v 
	$(VERILOG) -o $(TEMP) BCD_to7segm_tb.v  BCD_to7segm.v 
clean:
	-del $(TARGET)
	-del $(TEMP)