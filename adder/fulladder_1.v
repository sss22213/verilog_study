module fulladder(A,B,Cin,Cout,S);
	input A,B,Cin;
	output Cout,S;

	assign S=A^B^Cin;
	assign Cout=(A&B)|(B&Cin)|(A&Cin);

endmodule

module test;
	fulladder gate1(A,B,Cin,Cout,S);
	reg A,B,Cin;
	wire Cout,S;
	initial begin
		A=0;
		B=0;
		Cin=0;
	end
	always #50 begin
		Cin=Cin+1;
		$monitor("%4dns,%d,%d,%d,%d,%d",$stime,A,B,Cin,Cout,S);
	end
	always #100 begin
		B=B+1;
	end
	always #200 begin
		A=A+1;
	end
	initial #2000 $finish;
endmodule
