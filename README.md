# Verilog-Counters

This repository contains several counters, each implemented with a seperate style of Verilog.
	
	Ripple Up Counter:
	Implemented with a structural model of Verilog coding, the ripple (or asynchronous)
	counter is a simple FSM that requires no additional logic besides four D-Flip-Flops.

	Synchronous Up Counter:
	Implemented with a data-flow model of Verilog, and the Schematic design files of Quartus,
	the Synchronous Up counter improves upon the ripple counter by predetermining the states
	for each DFF and inputing them in parallel. Making it much faster.

	Johnson Ring Counter:
	Implemented with a behavioral model of Verilog, this variation of the ring counter does not
	count numerically, but rather pushes ones and then zeros across its registers, creating a
	staggered, elongated pulse.

This project is just a simple introduction to Verilog, and is just a sample of coding models as well as
practice with some of the basic building blocks of hardware definition.
