module fulladder(A,B,Cin,Sub,Cout,S);
	input A,B,Cin,Sub;
	output Cout,S;
	wire B_Temp,Cin_Temp;
	
	assign	B_Temp=B^Sub;
	assign	Cin_Temp=Sub;
	assign S=A^B_Temp^Cin_Temp;
	assign Cout=(A&B_Temp)|(B_Temp&Cin_Temp)|(A&Cin_Temp);

endmodule

module test;
	reg [7:0]A,[7:0]B,[7:0]Cin,Sub;
        wire [7:0]Cout,[7:0]S;
	fulladder gate1(A,B,Cin,Sub,Cout,S);
	initial begin
		A=0;
		B=0;
		Sub=1;
		//Cin=0;
	end
	always #50 begin
		//Cin=Cin+1;
		$monitor("%4dns,%d,%d,%d,%d,%d %d",$stime,A,B,Cin,Cout,S,Sub);
	end
	always #100 begin
		B=B+1;
	end
	always #200 begin
		A=A+1;
	end
	initial #2000 $finish;
endmodule
