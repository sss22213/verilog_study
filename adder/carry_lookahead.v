module carry_lookahead(X,Y,Cin,S,Cout);
input [7:0]X;
input [7:0]Y;
input [7:0]Cin;
output [7:0]S;
output [7:0]Cout;

wire [7:0]g;
wire [7:0]q;

assign g=X&Y;
assign p=x^Y;

assign Cout[0]=Cin;
assign Cout[1]=g[0]|(p[0]&Cout[0]);
assign Cout[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&Cout[0]);
assign Cout[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&Cout[0]);
assign Cout[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&Cout[0]);
assign Cout[5]=g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&p[0]&Cout[0]);
assign Cout[6]=g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|(p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&Cout[0]);
assign Cout[7]=g[6]|(p[6]&g[5])|(p[6]&p[5]&g[4])|(p[6]&p[5]&p[4]&g[3])|(p[6]&p[5]&p[4]&p[3]&g[2])|(p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&Cout[0]);
endmodule
