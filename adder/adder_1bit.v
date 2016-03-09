module Adder(input A,B,Cin,output C,S);
	wire A_bar,B_bar,Cin_bar,ACin,BCin;
	wire A_bar_B_barCin,A_bar_BCin_bar,ABCin,AB_barCin_bar;
	//C
	and g1(AB,A,B);
	and g2(BCin,B,Cin);
	and g3(ACin,A,Cin);
	or  g4(C,AB,BCin,ACin);
	//S
	not w1(A_bar,A);
	not w2(B_bar,B);
	not w3(Cin_bar,Cin);
	and g5(A_bar_B_barCin,A_bar,B_bar,Cin);
	and g6(A_bar_BCin_bar,A_bar,B,Cin_bar);
	and g7(ABCin,A,B,Cin);
	and g8(AB_barCin_bar,A,B_bar,Cin_bar);
	or  g9(S,A_bar_B_barCin,A_bar_BCin_bar,ABCin,AB_barCin_bar);
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
		Cin=Cin+1;
		$monitor("%4dns,%d,%d,%d,%d,%d",$stime,A,B,Cin,C,S);
	end
	always #100 begin
		B=B+1;
	end
	always #200 begin
		A=A+1;
	end
	initial #2000 $finish;
endmodule

