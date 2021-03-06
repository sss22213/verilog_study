//main module
module carry_lookahead(X,Y,Sub,Cin,S,Cout,temp);
input [7:0]X;
input [7:0]Y;
input [7:0]Cin;
input [7:0]Sub;
output wire[7:0]S;
output [7:0]Cout;

wire [7:0]g;
wire [7:0]q;
output wire [7:0]temp;

assign temp=Sub^Y;
assign g=X&temp;
assign p=X^temp;

assign Cout[0]=temp[0];
assign Cout[1]=g[0]|(p[0]&Cout[0]);
assign Cout[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&Cout[0]);
assign Cout[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&Cout[0]);
assign Cout[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&Cout[0]);
assign Cout[5]=g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&p[0]&Cout[0]);
assign Cout[6]=g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|(p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&Cout[0]);
assign Cout[7]=g[6]|(p[6]&g[5])|(p[6]&p[5]&g[4])|(p[6]&p[5]&p[4]&g[3])|(p[6]&p[5]&p[4]&p[3]&g[2])|(p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&Cout[0]);

assign S=X^temp^Cout;

endmodule

//test module
module test;

reg [7:0]X;
reg [7:0]Y;
reg [7:0]Cin;
reg [7:0]Sub;
wire [7:0]S;
wire [7:0]Cout;
wire [7:0]temp;
carry_lookahead DHU(X,Y,Sub,Cin,S,Cout,temp);

initial 
begin
	Sub=8'b11111111;
	Cin=8'b00000000;
	X=8'b10000001;
	Y=8'b01111110;
	#5 $monitor("%d %d %d %d %d %d",Cin,X,Y,Cout,S,temp);
end
endmodule
