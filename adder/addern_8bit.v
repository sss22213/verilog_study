module addern(carryin,X,Y,S,sub,carryout);

input [7:0]sub;
input carryin;
input [7:0]X,Y;
output reg [7:0]S;
output reg carryout;
reg [8:0]C;
integer K;
reg [7:0]temp;

always @(X,Y,carryin)
begin
	C[0]=sub[0];
	for(K=0;K<8;K=K+1)
	begin
		temp[K]=Y[K]^sub[K];
		S[K]=X[K]^temp[K]^C[K];
		C[K+1]=(X[K]&temp[K])|(X[K]&C[K])|(temp[K]&C[K]);
	end
	carryout=C[7];
end

endmodule

module test;

reg [7:0]sub;
reg carryin;
reg [7:0]X;
reg [7:0]Y;
wire [7:0]S;
wire carryout;
addern ADD1(carryin,X,Y,S,sub,carryout);

initial 
begin
	X=8'b10001011;
	Y=8'b00001001;
	sub=8'b11111111;
	carryin=0;
	$monitor("X=%x Y=%x S=%x",X,Y,S);
end
endmodule
