module proc (DIN, mem, Resetn, Clock, Run, Done, BusWires, pc, addrM, doutM, wM);
	input [15:0] DIN; // [15:13] -> Yreg // [12:10] -> Xreg // [9:6] -> I // [5:0] -> Offset
	input [15:0] mem;
	input Resetn, Clock, Run;
	
	output reg Done;
	output [15:0] BusWires;
	output [5:0] pc;
	
	output [15:0] addrM, doutM;
	output wM;
	
	//... declare variables
		wire Clear = Done | Resetn;		
		// regs
			wire [0:7] Xreg, Yreg;
			wire [15:0] R0, R1, R2, R3, R4, R5, R6, R7, A, G;	
			wire [15:0] aluOut;
		// instructions
			wire [9:0] IR;
			wire [3:0] I;	
		// time steps
			wire [1:0] TstepQ;		
		// signals
			reg dinOut, gOut, memOut, incr_pc, aIn, gIn, irIn, addrIn, doutIn, wIn;
			reg [0:7] regOut, regIn;
			reg [2:0] aluSignal;
		
	assign I = IR[3:0];
	dec3to8 decX (IR[6:4], 1'b1, Xreg);
	dec3to8 decY (IR[9:7], 1'b1, Yreg);	
	upcount tstep (Clear, Clock, TstepQ);

	always @(TstepQ or I or Xreg or Yreg) begin
		
		//... specify initial values		
		regOut[0:7] = 8'b0;
		regIn [0:7] = 8'b0;	
		dinOut = 1'b0;			
		gOut = 1'b0;	
		memOut = 1'b0;
		incr_pc = 1'b0;
		aIn = 1'b0;
		gIn = 1'b0;
		irIn = 1'b0;
		addrIn = 1'b0;
		doutIn = 1'b0;
		wIn = 1'b0;
		aluSignal = 3'b000;
		Done = 1'b0;
		
		if (Run) begin
			case (TstepQ)
				2'b00: // load instruction time step 0
					begin
						regOut = 8'b00000001;
						irIn = 1'b1;
						incr_pc = 1; // pula para proxima instrucao ou imediato
					end	
					
				2'b01: //define signals in time step 1
					case (I)				
						4'b0000: begin	// mv 
							regOut = Yreg;
							regIn = Xreg;
							Done = 1'b1;							
						end
						
						4'b0001: begin		//mvi					
							//FOI STAll
							//regIn = Xreg;
							//dinOut = 1;
							//Done = 1;
							//incr_pc = 1;
							
						end
						4'b0010: begin 
							end
						
						4'b0011: begin		// mvnz
							if (G != 0) begin
								  regOut = Yreg;
								  regIn = Xreg;
								end
								Done = 1;
						end
						
						4'b0100: begin	//load					
							regOut = Yreg;
							addrIn = 1;	
						end
						
						
						4'b0101: begin	// st 					
							regOut = Xreg;
							doutIn = 1;
						end
						
						4'b0110: begin		//add						
							regOut = Xreg;
							aIn = 1;
						end
						 
						4'b0111: begin			// sub					
							regOut = Xreg;
							aIn = 1;
						end
						
						4'b1000: begin //or				
							regOut = Xreg;
							aIn = 1;
						end
						
						4'b1001: begin // Slt
							regOut = Xreg;
							aIn = 1;
						end
						
						4'b1010: begin // Sll
							regOut = Xreg;
							aIn = 1;
						end
						
						4'b1011: begin // Srl
							regOut = Xreg;
							aIn = 1;
							end
					endcase
					
					
				2'b10: //define signals in time step 2
				 if(I > 4'b0101) begin
					gIn = 1'b1;
					regOut = Yreg;
					case (I)				
							4'b0110:    aluSignal = 3'b000;
                     4'b0111:    aluSignal = 3'b001;
                     4'b1000:    aluSignal = 3'b010;
                     4'b1001: 	aluSignal = 3'b011;
                     4'b1010: 	aluSignal = 3'b100;
                     4'b1011: 	aluSignal = 3'b101;
							
					endcase
					end
					else begin 
						if(I == 4'b0101) begin
							regOut = Yreg;
							addrIn = 1;
							wIn = 1;
						end
						
						//if(I == 4'b0100) begin
						//	dinOut = 1'b1;
						//	regIn = Xreg;
						//	Done = 1;
						//end
						
						if(I == 4'b0001) begin
							regIn = Xreg;
							dinOut = 1'b1;
							Done = 1'b1;
							#20 regOut = 5'b00001;
							incr_pc = 1;
						end
					end
					
				2'b11: //define signals in time step 3
					if(I > 4'b0101) begin
						gOut = 1'b1;
						regIn = Xreg;
						Done = 1'b1;
					end
					else begin
						if(I == 4'b0100) begin
							regIn = Xreg;
							memOut = 1;
							Done = 1'b1;
						end
						end
			endcase
		end
	end
		
	//... instantiate other registers and the adder/subtracter unit
		// Standart registers
			regn reg_0 (BusWires, regIn[0], Clock, R0, Resetn);
			regn reg_1 (BusWires, regIn[1], Clock, R1, Resetn);
			regn reg_2 (BusWires, regIn[2], Clock, R2, Resetn);
			regn reg_3 (BusWires, regIn[3], Clock, R3, Resetn);
			regn reg_4 (BusWires, regIn[4], Clock, R4, Resetn);
			regn reg_5 (BusWires, regIn[5], Clock, R5, Resetn);
			regn reg_6 (BusWires, regIn[6], Clock, R6, Resetn);
			//regn reg_7 (BusWires, 0, Clock, R7, Resetn);
			
		//Counter
		counterlpm count (1'b1, Clock, incr_pc, BusWires[5:0], Resetn, regIn[7], pc);
			
		//Alu
		alu alu (aluSignal, A, BusWires, aluOut);
			
		// Aux reg for multi-cycle
			regn reg_A(BusWires, aIn, Clock, A, Resetn);
			regn reg_G(aluOut, gIn, Clock, G, Resetn);			
			
		// Instruction register
			regn reg_IR(DIN[15:6], irIn, Clock, IR, Resetn);	
			defparam reg_IR.n = 10; 
			
		// Memory register
			regn reg_Addr(BusWires, addrIn, Clock, addrM, Resetn);
			regn reg_Dout(BusWires, doutIn, Clock, doutM, Resetn);		
			regn reg_W(wIn, 1'b1, Clock, wM, Resetn);	
			defparam reg_W.n = 1;	
						
	//... define the bus
		//multiplex multiplex (DIN, R0, R1, R2, R3, pc, G, mem, {dinOut, regOut, gOut, memOut}, BusWires);
		//multiplex multiplex (DIN, R0, R1, R2, R3, R4, R5, R6, pc, G, mem, {dinOut, regOut, gOut, memOut}, BusWires);
		multiplex multiplex (DIN, R0, R1, R2, R3, R4, R5, R6, pc, G, {dinOut, regOut, gOut}, BusWires);
	
	
	

endmodule
