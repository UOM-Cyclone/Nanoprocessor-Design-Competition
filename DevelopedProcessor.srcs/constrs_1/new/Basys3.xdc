## Clock signal
set_property PACKAGE_PIN W5 [get_ports Clk]
	set_property IOSTANDARD LVCMOS33 [get_ports Clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {RomSel[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {RomSel[0]}]
set_property PACKAGE_PIN V16 [get_ports {RomSel[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {RomSel[1]}]
set_property PACKAGE_PIN W16 [get_ports {RomSel[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {RomSel[2]}]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {LED[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]

set_property PACKAGE_PIN N3 [get_ports {Negative}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Negative}]
set_property PACKAGE_PIN P1 [get_ports {Zero}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Zero}]
set_property PACKAGE_PIN L1 [get_ports {Overflow}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Overflow}]

##7 Segment Display	
set_property PACKAGE_PIN U2 [get_ports {SegOn[0]}] 
     set_property IOSTANDARD LVCMOS33 [get_ports {SegOn[0]}] 
set_property PACKAGE_PIN U4 [get_ports {SegOn[1]}] 
     set_property IOSTANDARD LVCMOS33 [get_ports {SegOn[1]}] 
set_property PACKAGE_PIN V4 [get_ports {SegOn[2]}] 
     set_property IOSTANDARD LVCMOS33 [get_ports {SegOn[2]}] 
set_property PACKAGE_PIN W4 [get_ports {SegOn[3]}] 
     set_property IOSTANDARD LVCMOS33 [get_ports {SegOn[3]}] 

##7 segments
set_property PACKAGE_PIN W7 [get_ports {SevenSegOut[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[0]}]
set_property PACKAGE_PIN W6 [get_ports {SevenSegOut[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[1]}]
set_property PACKAGE_PIN U8 [get_ports {SevenSegOut[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[2]}]
set_property PACKAGE_PIN V8 [get_ports {SevenSegOut[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[3]}]
set_property PACKAGE_PIN U5 [get_ports {SevenSegOut[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[4]}]
set_property PACKAGE_PIN V5 [get_ports {SevenSegOut[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[5]}]
set_property PACKAGE_PIN U7 [get_ports {SevenSegOut[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegOut[6]}]

##Push Buttons	
set_property PACKAGE_PIN U17 [get_ports Res]
        set_property IOSTANDARD LVCMOS33 [get_ports Res]