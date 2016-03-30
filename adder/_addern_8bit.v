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
//declare
reg [7:0]sub;
reg carryin;
reg [7:0]X;
reg [7:0]Y;
wire [7:0]S;
wire carryout;
integer i,j;
reg [7:0]major1,major2;

//caller
addern ADD1(carryin,X,Y,S,sub,carryout);

//simuation start
initial 
begin
	X=8'b00000000;
	Y=8'b00000000;;
	major1=8'b00000000;
	major2=8'b00000000;
	sub=8'b11111111;
	carryin=0;
end
always
begin
	for(i=0;i<255;i=i+1)
	begin 
 		major1=major1+1;
		 X=major1;
		for(j=0;j<255;j=j+1)
		begin
			 major2=major2+1;
			 Y=major2;
			#1 $display("%d %d %d",X,Y,S);
		end
	end
end
initial #90000 $finish;
endmodule
