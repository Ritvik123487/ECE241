`timescale 1ns / 1ns // `timescale time_unit/time_precision

module v7432 (pin1,pin3,pin5,pin9,pin11,pin13,pin2,pin4,pin6,pin8,pin10,pin12);
	
	input pin1, pin2,pin4,pin5,pin13,pin12,pin10,pin9;
	output pin3,pin6,pin11,pin8;
	
	assign pin3 = pin1|pin2;
	assign pin6 = pin4|pin5;
	assign pin11 = pin13|pin12;
	assign pin8 = pin10|pin9;

endmodule

module v7404 (pin1,pin3,pin5,pin9,pin11,pin13,pin2,pin4,pin6,pin8,pin10,pin12);
	
	input pin1, pin3,pin5,pin13,pin11,pin9;
	output pin2,pin4,pin6,pin12,pin10,pin8;

	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin12 = ~pin13;
	assign pin10 = ~pin11;
	assign pin8 = ~pin9;
endmodule

module v7408 (pin1,pin3,pin5,pin9,pin11,pin13,pin2,pin4,pin6,pin8,pin10,pin12);
	
	input pin1, pin2,pin4,pin5,pin13,pin12,pin10,pin9;
	output pin3,pin6,pin11,pin8;
	
	assign pin3 = pin1&pin2;
	assign pin6 = pin4&pin5;
	assign pin11 = pin13&pin12;
	assign pin8 = pin10&pin9;

endmodule

module mux2to1 (x, y, s, m);
    input x, y, s;
    output m;
    wire not_s, and1, and2;

    v7404 not_gate(
        .pin1(s),
        .pin2(not_s)
    ); //Invert the switch

    v7408 and_gate1(
        .pin1(x),
        .pin2(not_s),
        .pin3(and1),
        .pin4(y),
        .pin5(s),
        .pin6(and2)
    );

    v7432 or_gate(
        .pin1(and1),
        .pin2(and2),
        .pin3(m)
    );

endmodule
	
		
	



