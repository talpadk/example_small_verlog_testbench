HERE := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

divider_tb.vvp:	divider_tb.v divider.v
		iverilog -o divider_tb.vvp divider_tb.v divider.v

divider_tb.lxt2: divider_tb.vvp
		$(HERE)divider_tb.vvp -lxt2

show:	divider_tb.lxt2
		gtkwave divider_tb.lxt2
