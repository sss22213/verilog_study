module addern(carryin,X,Y,S,carryout);

input carryin;
input [7:0]X,Y;
output reg [7:0]S;
output reg carryout;
reg [8:0]C;
integer K;

always @(X,Y,carryin)
begin
	C[0]=carryin;
	for(K=0;K<8;K=K+1)
	begin
		S[K]=X[K]^Y[K]^C[K];
		C[K+1]=(X[K]&Y[K])|(X[K]&C[K])|(Y[K]&C[K]);
	end
	carryout=C[7];
end

endmodule

module test;

reg carryin;
reg [7:0]X,Y;
wire [7:0]S;
wire carryout;
addern ADD1(carryin,X,Y,S,carryout);
initial 
begin
	X=8'b00000001;
	Y=8'b00000011;
	carryin=0;
	$monitor("%x",S);
end
endmodule
