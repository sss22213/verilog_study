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
	Adder gate1(A,B,Cin,C,S);
	Adder gate2(A2,B2,C,C2,S2);
	Adder gate3(A3,B3,C2,C3,S3);
	Adder gate4(A4,B4,C3,C4,S4);
	reg A,A2,A3,A4,B,B2,B3,B4,Cin;
	wire C,C2,C3,C4,S,S2,S3,S4;
	
	initial begin
		A=0;
		A2=0;
		A3=0;
		A4=0;
		B=0;
		B2=0;
		B3=0;
		B4=0;
		Cin=0;
	end
	always #50 begin
		Cin=Cin+1;
		$display("1Bit: %4dns,input: %d,%d,%d,output: %d,%d",$stime,A,B,Cin,C,S);
		$display("2Bit: %4dns,input: %d,%d,%d,output: %d,%d",$stime,A2,B2,C,C2,S2);
		$display("3Bit: %4dns,input: %d,%d,%d,output: %d,%d",$stime,A3,B3,C2,C3,S3);
		$display("4Bit: %4dns,input: %d,%d,%d,output: %d,%d",$stime,A4,B4,C3,C4,S4);
	end
	always #150 begin
		B=B+1;
		B2=B2+1;
		B3=B3+1;
		B4=B4+1;
	end
	always #300 begin
		A=A+1;
		A2=A2+1;
		A3=A3+1;
		A4=A4+1;
	end
	initial #3000 $finish;
endmodule

