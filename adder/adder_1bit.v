module Adder(input A,B,Cin,output C,S);
	wire A_bar,B_bar,Cin_bar,ACin,BCin;
	wire A_bar_B_barC,A_bar_BC_bar,ABC,AB_barC_bar;
	//C
	and g1(AB,A,B);
	and g2(BCin,B,Cin);
	and g3(ACin,A,Cin);
	or  g4(C,AB,BCin,ACin);
	//S
	and g5(A_bar_B_barC,A_bar,B_bar,Cin);
	and g6(A_bar_BC_bar,A_bar,B,C_bar);
	and g7(ABC,A,B,C);
	and g8(AB_barC_bar,A,B_bar,C_bar);
	or  g9(S,A_bar_B_barC,A_bar_BC_bar,ABC,AB_barC_bar);
endmodule

module test;
	Adder gate(A,B,Cin,C,S);
	reg A,B,Cin;
	wire C,S;
	initial begin
		A=0;
		B=0;
		Cin=0;
	end
	always #50 begin
		A=A+1;
		$monitor("%4dns,%d,%d,%d,%d,%d",$stime,A,B,Cin,C,S);
	end
	always #100 begin
		B=B+1;
	end
	always #200 begin
		Cin=Cin+1;
	end
	initial #2000 $finish;
endmodule

