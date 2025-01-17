// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Mon Dec 23 21:54:50 2024"

module test(
	keypad1,
	keypad2,
	keypad3,
	keypad4,
	clk69,
	reset,
	trigger,
	a1,
	b2,
	c3,
	d4,
	e5,
	f6,
	g7,
	com8,
	com7,
	com6,
	com5,
	com4,
	com3,
	com2,
	com1,
	a,
	b,
	c,
	d,
	e,
	f,
	g,
	lcd_e,
	lcd_rs,
	lcd_rw,
	blue1,
	blue2,
	blue3,
	blue4,
	green1,
	green2,
	green3,
	greeen4,
	red1,
	red2,
	red3,
	red4,
	piezo,
	lcd_out
);


input wire	keypad1;
input wire	keypad2;
input wire	keypad3;
input wire	keypad4;
input wire	clk69;
input wire	reset;
input wire	trigger;
output wire	a1;
output wire	b2;
output wire	c3;
output wire	d4;
output wire	e5;
output wire	f6;
output wire	g7;
output wire	com8;
output wire	com7;
output wire	com6;
output wire	com5;
output wire	com4;
output wire	com3;
output wire	com2;
output wire	com1;
output wire	a;
output wire	b;
output wire	c;
output wire	d;
output wire	e;
output wire	f;
output wire	g;
output wire	lcd_e;
output wire	lcd_rs;
output wire	lcd_rw;
output wire	blue1;
output wire	blue2;
output wire	blue3;
output wire	blue4;
output wire	green1;
output wire	green2;
output wire	green3;
output wire	greeen4;
output wire	red1;
output wire	red2;
output wire	red3;
output wire	red4;
output wire	piezo;
output wire	[7:0] lcd_out;

wire	[15:0] bmp;
wire	[3:0] bs;
wire	[3:0] count;
wire	[2:0] din;
wire	[1:0] in;
wire	[15:0] p;
wire	[3:0] st;
wire	SYNTHESIZED_WIRE_85;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_86;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_87;
wire	SYNTHESIZED_WIRE_88;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[1:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_89;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_90;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_91;
wire	[1:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_92;
wire	SYNTHESIZED_WIRE_93;
wire	SYNTHESIZED_WIRE_94;
wire	SYNTHESIZED_WIRE_95;
wire	SYNTHESIZED_WIRE_51;
wire	[19:0] SYNTHESIZED_WIRE_53;
wire	[19:0] SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_58;
wire	[15:0] SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_96;
wire	SYNTHESIZED_WIRE_82;
wire	SYNTHESIZED_WIRE_84;





is_correct	b2v_inst(
	.enable(SYNTHESIZED_WIRE_85),
	.Din0(bmp),
	.Din1(p),
	.correct(SYNTHESIZED_WIRE_92));

assign	SYNTHESIZED_WIRE_23 = din[2] & din[1] & din[0];

assign	SYNTHESIZED_WIRE_22 = din[2] & SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2;


input_module	b2v_inst11(
	.in1(keypad1),
	.in2(keypad2),
	.in3(keypad3),
	.in4(keypad4),
	.enable(SYNTHESIZED_WIRE_86),
	.binary_out(in));

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_4 & din[1] & din[0];


trigger	b2v_inst13(
	.Din(SYNTHESIZED_WIRE_87),
	.CLK(clk69),
	.rst_n(SYNTHESIZED_WIRE_88),
	.Dout(SYNTHESIZED_WIRE_90));

assign	SYNTHESIZED_WIRE_87 = keypad1 | keypad3 | keypad4 | keypad2;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_7 & din[1] & SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_9 & SYNTHESIZED_WIRE_10 & din[0];

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_62 =  ~din[0];

assign	SYNTHESIZED_WIRE_84 =  ~din[1];


LED	b2v_inst2(
	.enable(SYNTHESIZED_WIRE_14),
	.din(SYNTHESIZED_WIRE_15),
	.blue1(blue1),
	.blue2(blue2),
	.blue3(blue3),
	.blue4(blue4),
	.green1(green1),
	.green2(green2),
	.green3(green3),
	.green4(greeen4),
	.red1(red1),
	.red2(red2),
	.red3(red3),
	.red4(red4));


assign	SYNTHESIZED_WIRE_13 =  ~din[0];

assign	SYNTHESIZED_WIRE_11 =  ~din[2];

assign	SYNTHESIZED_WIRE_12 =  ~din[1];

assign	SYNTHESIZED_WIRE_9 =  ~din[2];

assign	SYNTHESIZED_WIRE_10 =  ~din[1];

assign	SYNTHESIZED_WIRE_7 =  ~din[2];

assign	SYNTHESIZED_WIRE_8 =  ~din[0];

assign	SYNTHESIZED_WIRE_4 =  ~din[2];


timer_7seg	b2v_inst3(
	.clk(clk69),
	.reset_n(SYNTHESIZED_WIRE_88),
	.start_countdown(SYNTHESIZED_WIRE_89),
	.next_stage(SYNTHESIZED_WIRE_86),
	.seconds(st[1:0]));
	defparam	b2v_inst3.CLOCK_DIVIDE = 1000000;
	defparam	b2v_inst3.COUNTDOWN = 2'b01;
	defparam	b2v_inst3.IDLE = 2'b00;
	defparam	b2v_inst3.NEXT = 2'b10;

assign	SYNTHESIZED_WIRE_1 =  ~din[1];

assign	SYNTHESIZED_WIRE_2 =  ~din[0];

assign	com8 =  ~SYNTHESIZED_WIRE_18;

assign	com7 =  ~SYNTHESIZED_WIRE_19;

assign	com6 =  ~SYNTHESIZED_WIRE_20;

assign	com5 =  ~SYNTHESIZED_WIRE_21;

assign	com4 =  ~SYNTHESIZED_WIRE_22;

assign	com1 =  ~SYNTHESIZED_WIRE_23;

assign	com2 =  ~SYNTHESIZED_WIRE_24;

assign	com3 =  ~SYNTHESIZED_WIRE_25;


counter_4bit	b2v_inst4(
	.clk(SYNTHESIZED_WIRE_90),
	.reset_n(SYNTHESIZED_WIRE_88),
	.enable(SYNTHESIZED_WIRE_86),
	.done(SYNTHESIZED_WIRE_85)
	);


b2seg	b2v_inst40(
	.b_in(bs),
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.e(e),
	.f(f),
	.g(g));

assign	SYNTHESIZED_WIRE_96 = SYNTHESIZED_WIRE_89 ^ SYNTHESIZED_WIRE_89;


mux_2x1	b2v_inst42(
	.s_1(SYNTHESIZED_WIRE_31),
	.sel(SYNTHESIZED_WIRE_86),
	.s_0(SYNTHESIZED_WIRE_33),
	.m_out(SYNTHESIZED_WIRE_14));

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_91 & SYNTHESIZED_WIRE_86 & SYNTHESIZED_WIRE_87;


counter	b2v_inst44(
	.clk(clk69),
	.rst_n(SYNTHESIZED_WIRE_88),
	.Q0(din[2]),
	.Q1(din[1]),
	.Q2(din[0]));


mux_2x1_2bit	b2v_inst45(
	.ce(SYNTHESIZED_WIRE_86),
	.s0(SYNTHESIZED_WIRE_39),
	.s1(in),
	.m_out(SYNTHESIZED_WIRE_15));


piezo_sound	b2v_inst46(
	.clk_1mhz(clk69),
	.enable(SYNTHESIZED_WIRE_85),
	.equal(SYNTHESIZED_WIRE_92),
	.piezo(piezo));
	defparam	b2v_inst46.DO1 = 1910;
	defparam	b2v_inst46.LE = 1706;
	defparam	b2v_inst46.TONE_DURATION = 2000000;

assign	p[0] =  ~SYNTHESIZED_WIRE_93;

assign	p[1] =  ~SYNTHESIZED_WIRE_93;

assign	p[2] =  ~SYNTHESIZED_WIRE_93;

assign	SYNTHESIZED_WIRE_91 =  ~SYNTHESIZED_WIRE_85;

assign	SYNTHESIZED_WIRE_88 =  ~reset;

assign	SYNTHESIZED_WIRE_51 =  ~SYNTHESIZED_WIRE_89;


counter_20	b2v_inst52(
	.CLK(clk69),
	.CE(SYNTHESIZED_WIRE_94),
	.reset(SYNTHESIZED_WIRE_88),
	.OUT(SYNTHESIZED_WIRE_54));

assign	SYNTHESIZED_WIRE_33 = SYNTHESIZED_WIRE_95 & SYNTHESIZED_WIRE_94 & SYNTHESIZED_WIRE_51;


timer_7seg	b2v_inst54(
	.clk(clk69),
	.reset_n(SYNTHESIZED_WIRE_88),
	.start_countdown(trigger),
	.next_stage(SYNTHESIZED_WIRE_94)
	);
	defparam	b2v_inst54.CLOCK_DIVIDE = 1000000;
	defparam	b2v_inst54.COUNTDOWN = 2'b01;
	defparam	b2v_inst54.IDLE = 2'b00;
	defparam	b2v_inst54.NEXT = 2'b10;


comparator_20_leq	b2v_inst55(
	.IN1(SYNTHESIZED_WIRE_53),
	.IN2(SYNTHESIZED_WIRE_54),
	.LE(SYNTHESIZED_WIRE_95));


const_0_20bit	b2v_inst56(
	.CLK(clk69),
	.Const_1(SYNTHESIZED_WIRE_53));


rand_shift	b2v_inst57(
	.clk(SYNTHESIZED_WIRE_95),
	.reset(SYNTHESIZED_WIRE_88),
	.ce(SYNTHESIZED_WIRE_94),
	.ce_16bit(SYNTHESIZED_WIRE_58),
	.clk_16bit(clk69),
	.rand(SYNTHESIZED_WIRE_59),
	.done(SYNTHESIZED_WIRE_89),
	
	
	.shift_data(SYNTHESIZED_WIRE_39));

assign	p[3] =  ~SYNTHESIZED_WIRE_93;

assign	p[4] =  ~SYNTHESIZED_WIRE_93;

assign	SYNTHESIZED_WIRE_24 = din[2] & din[1] & SYNTHESIZED_WIRE_62;

assign	p[5] =  ~SYNTHESIZED_WIRE_93;


lcd	b2v_inst61(
	.CLK(clk69),
	.RESETN(SYNTHESIZED_WIRE_88),
	.ENABLE(SYNTHESIZED_WIRE_85),
	.is_equal(SYNTHESIZED_WIRE_92),
	.TLCD_RS(lcd_rs),
	.TLCD_RW(lcd_rw),
	.TLCD_E(lcd_e),
	
	.TLCD_DATA(lcd_out));
	defparam	b2v_inst61.CLEAR_DISP = 5'b00111;
	defparam	b2v_inst61.CLEAR_DISP_WAIT = 5'b01000;
	defparam	b2v_inst61.CLEAR_EXEC = 1640;
	defparam	b2v_inst61.CLEAR_TEXT = 5'b10010;
	defparam	b2v_inst61.DISP_ONOFF = 5'b00011;
	defparam	b2v_inst61.DISP_ONOFF_WAIT = 5'b00100;
	defparam	b2v_inst61.DISPLAY_HOLD = 5'b10001;
	defparam	b2v_inst61.DISPLAY_TIME = 2000000;
	defparam	b2v_inst61.DONE_STATE = 5'b10011;
	defparam	b2v_inst61.E_PULSE_WIDTH = 1;
	defparam	b2v_inst61.ENTRY_MODE = 5'b00101;
	defparam	b2v_inst61.ENTRY_MODE_WAIT = 5'b00110;
	defparam	b2v_inst61.EXEC_TIME = 40;
	defparam	b2v_inst61.FUNCTION_SET = 5'b00001;
	defparam	b2v_inst61.FUNCTION_SET_WAIT = 5'b00010;
	defparam	b2v_inst61.IDLE = 5'b00000;
	defparam	b2v_inst61.INITIALIZE = 5'b10100;
	defparam	b2v_inst61.LINE1_ADDR = 5'b01001;
	defparam	b2v_inst61.LINE1_ADDR_WAIT = 5'b01010;
	defparam	b2v_inst61.LINE1_WRITE = 5'b01011;
	defparam	b2v_inst61.LINE1_WRITE_WAIT = 5'b01100;
	defparam	b2v_inst61.LINE2_ADDR = 5'b01101;
	defparam	b2v_inst61.LINE2_ADDR_WAIT = 5'b01110;
	defparam	b2v_inst61.LINE2_WRITE = 5'b01111;
	defparam	b2v_inst61.LINE2_WRITE_WAIT = 5'b10000;

assign	p[6] =  ~SYNTHESIZED_WIRE_93;

assign	SYNTHESIZED_WIRE_93 = SYNTHESIZED_WIRE_96 ^ SYNTHESIZED_WIRE_96;

assign	p[7] =  ~SYNTHESIZED_WIRE_93;

assign	p[8] =  ~SYNTHESIZED_WIRE_93;

assign	p[9] =  ~SYNTHESIZED_WIRE_93;

assign	p[10] =  ~SYNTHESIZED_WIRE_93;

assign	p[11] =  ~SYNTHESIZED_WIRE_93;


lfsr_16bit	b2v_inst69(
	.clk(clk69),
	.next_stage(SYNTHESIZED_WIRE_94),
	.has_generated(SYNTHESIZED_WIRE_58),
	.rand_out(SYNTHESIZED_WIRE_59));


b2seg	b2v_inst7(
	.b_in(st),
	.a(a1),
	.b(b2),
	.c(c3),
	.d(d4),
	.e(e5),
	.f(f6),
	.g(g7));

assign	SYNTHESIZED_WIRE_82 = SYNTHESIZED_WIRE_90 & clk69 & SYNTHESIZED_WIRE_91;

assign	p[12] =  ~SYNTHESIZED_WIRE_93;

assign	p[13] =  ~SYNTHESIZED_WIRE_93;

assign	p[14] =  ~SYNTHESIZED_WIRE_93;

assign	p[15] =  ~SYNTHESIZED_WIRE_93;


two_bit_regx8	b2v_inst8(
	.clk(clk69),
	.ce(SYNTHESIZED_WIRE_82),
	.rst_n(SYNTHESIZED_WIRE_88),
	.din(in),
	.muxCe(din),
	.arr8(bs[1:0]),
	.rs({bmp[15:14],bmp[13:12],bmp[11:10],bmp[9:8],bmp[7:6],bmp[5:4],bmp[3:2],bmp[1:0]}));

assign	SYNTHESIZED_WIRE_25 = din[2] & SYNTHESIZED_WIRE_84 & din[0];


endmodule
