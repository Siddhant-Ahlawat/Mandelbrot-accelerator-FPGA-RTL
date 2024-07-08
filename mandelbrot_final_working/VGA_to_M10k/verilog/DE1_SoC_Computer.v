

module DE1_SoC_Computer (
	////////////////////////////////////
	// FPGA Pins
	////////////////////////////////////

	// Clock pins
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	CLOCK4_50,

	// ADC
	ADC_CS_N,
	ADC_DIN,
	ADC_DOUT,
	ADC_SCLK,

	// Audio
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	// SDRAM
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_UDQM,
	DRAM_WE_N,

	// I2C Bus for Configuration of the Audio and Video-In Chips
	FPGA_I2C_SCLK,
	FPGA_I2C_SDAT,

	// 40-Pin Headers
	GPIO_0,
	GPIO_1,
	
	// Seven Segment Displays
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,

	// IR
	IRDA_RXD,
	IRDA_TXD,

	// Pushbuttons
	KEY,

	// LEDs
	LEDR,

	// PS2 Ports
	PS2_CLK,
	PS2_DAT,
	
	PS2_CLK2,
	PS2_DAT2,

	// Slider Switches
	SW,

	// Video-In
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	// VGA
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	////////////////////////////////////
	// HPS Pins
	////////////////////////////////////
	
	// DDR3 SDRAM
	HPS_DDR3_ADDR,
	HPS_DDR3_BA,
	HPS_DDR3_CAS_N,
	HPS_DDR3_CKE,
	HPS_DDR3_CK_N,
	HPS_DDR3_CK_P,
	HPS_DDR3_CS_N,
	HPS_DDR3_DM,
	HPS_DDR3_DQ,
	HPS_DDR3_DQS_N,
	HPS_DDR3_DQS_P,
	HPS_DDR3_ODT,
	HPS_DDR3_RAS_N,
	HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ,
	HPS_DDR3_WE_N,

	// Ethernet
	HPS_ENET_GTX_CLK,
	HPS_ENET_INT_N,
	HPS_ENET_MDC,
	HPS_ENET_MDIO,
	HPS_ENET_RX_CLK,
	HPS_ENET_RX_DATA,
	HPS_ENET_RX_DV,
	HPS_ENET_TX_DATA,
	HPS_ENET_TX_EN,

	// Flash
	HPS_FLASH_DATA,
	HPS_FLASH_DCLK,
	HPS_FLASH_NCSO,

	// Accelerometer
	HPS_GSENSOR_INT,
		
	// General Purpose I/O
	HPS_GPIO,
		
	// I2C
	HPS_I2C_CONTROL,
	HPS_I2C1_SCLK,
	HPS_I2C1_SDAT,
	HPS_I2C2_SCLK,
	HPS_I2C2_SDAT,

	// Pushbutton
	HPS_KEY,

	// LED
	HPS_LED,
		
	// SD Card
	HPS_SD_CLK,
	HPS_SD_CMD,
	HPS_SD_DATA,

	// SPI
	HPS_SPIM_CLK,
	HPS_SPIM_MISO,
	HPS_SPIM_MOSI,
	HPS_SPIM_SS,

	// UART
	HPS_UART_RX,
	HPS_UART_TX,

	// USB
	HPS_CONV_USB_N,
	HPS_USB_CLKOUT,
	HPS_USB_DATA,
	HPS_USB_DIR,
	HPS_USB_NXT,
	HPS_USB_STP
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

////////////////////////////////////
// FPGA Pins
////////////////////////////////////

// Clock pins
input						CLOCK_50;
input						CLOCK2_50;
input						CLOCK3_50;
input						CLOCK4_50;

// ADC
inout						ADC_CS_N;
output					ADC_DIN;
input						ADC_DOUT;
output					ADC_SCLK;

// Audio
input						AUD_ADCDAT;
inout						AUD_ADCLRCK;
inout						AUD_BCLK;
output					AUD_DACDAT;
inout						AUD_DACLRCK;
output					AUD_XCK;

// SDRAM
output 		[12: 0]	DRAM_ADDR;
output		[ 1: 0]	DRAM_BA;
output					DRAM_CAS_N;
output					DRAM_CKE;
output					DRAM_CLK;
output					DRAM_CS_N;
inout			[15: 0]	DRAM_DQ;
output					DRAM_LDQM;
output					DRAM_RAS_N;
output					DRAM_UDQM;
output					DRAM_WE_N;

// I2C Bus for Configuration of the Audio and Video-In Chips
output					FPGA_I2C_SCLK;
inout						FPGA_I2C_SDAT;

// 40-pin headers
inout			[35: 0]	GPIO_0;
inout			[35: 0]	GPIO_1;

// Seven Segment Displays
output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
output		[ 6: 0]	HEX2;
output		[ 6: 0]	HEX3;
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;

// IR
input						IRDA_RXD;
output					IRDA_TXD;

// Pushbuttons
input			[ 3: 0]	KEY;

// LEDs
output		[ 9: 0]	LEDR;

// PS2 Ports
inout						PS2_CLK;
inout						PS2_DAT;

inout						PS2_CLK2;
inout						PS2_DAT2;

// Slider Switches
input			[ 9: 0]	SW;

// Video-In
input						TD_CLK27;
input			[ 7: 0]	TD_DATA;
input						TD_HS;
output					TD_RESET_N;
input						TD_VS;

// VGA
output		[ 7: 0]	VGA_B;
output					VGA_BLANK_N;
output					VGA_CLK;
output		[ 7: 0]	VGA_G;
output					VGA_HS;
output		[ 7: 0]	VGA_R;
output					VGA_SYNC_N;
output					VGA_VS;



////////////////////////////////////
// HPS Pins
////////////////////////////////////
	
// DDR3 SDRAM
output		[14: 0]	HPS_DDR3_ADDR;
output		[ 2: 0]  HPS_DDR3_BA;
output					HPS_DDR3_CAS_N;
output					HPS_DDR3_CKE;
output					HPS_DDR3_CK_N;
output					HPS_DDR3_CK_P;
output					HPS_DDR3_CS_N;
output		[ 3: 0]	HPS_DDR3_DM;
inout			[31: 0]	HPS_DDR3_DQ;
inout			[ 3: 0]	HPS_DDR3_DQS_N;
inout			[ 3: 0]	HPS_DDR3_DQS_P;
output					HPS_DDR3_ODT;
output					HPS_DDR3_RAS_N;
output					HPS_DDR3_RESET_N;
input						HPS_DDR3_RZQ;
output					HPS_DDR3_WE_N;

// Ethernet
output					HPS_ENET_GTX_CLK;
inout						HPS_ENET_INT_N;
output					HPS_ENET_MDC;
inout						HPS_ENET_MDIO;
input						HPS_ENET_RX_CLK;
input			[ 3: 0]	HPS_ENET_RX_DATA;
input						HPS_ENET_RX_DV;
output		[ 3: 0]	HPS_ENET_TX_DATA;
output					HPS_ENET_TX_EN;

// Flash
inout			[ 3: 0]	HPS_FLASH_DATA;
output					HPS_FLASH_DCLK;
output					HPS_FLASH_NCSO;

// Accelerometer
inout						HPS_GSENSOR_INT;

// General Purpose I/O
inout			[ 1: 0]	HPS_GPIO;

// I2C
inout						HPS_I2C_CONTROL;
inout						HPS_I2C1_SCLK;
inout						HPS_I2C1_SDAT;
inout						HPS_I2C2_SCLK;
inout						HPS_I2C2_SDAT;

// Pushbutton
inout						HPS_KEY;

// LED
inout						HPS_LED;

// SD Card
output					HPS_SD_CLK;
inout						HPS_SD_CMD;
inout			[ 3: 0]	HPS_SD_DATA;

// SPI
output					HPS_SPIM_CLK;
input						HPS_SPIM_MISO;
output					HPS_SPIM_MOSI;
inout						HPS_SPIM_SS;

// UART
input						HPS_UART_RX;
output					HPS_UART_TX;

// USB
inout						HPS_CONV_USB_N;
input						HPS_USB_CLKOUT;
inout			[ 7: 0]	HPS_USB_DATA;
input						HPS_USB_DIR;
input						HPS_USB_NXT;
output					HPS_USB_STP;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire			[15: 0]	hex3_hex0;
//wire			[15: 0]	hex5_hex4;



HexDigit Digit0(HEX0, zoom[3:0]);
HexDigit Digit1(HEX1, {2'd0,done[1:0]});
HexDigit Digit2(HEX2, timee[3:0]);
HexDigit Digit3(HEX3, timee[7:4]);
HexDigit Digit4(HEX4, timee[11:8]);
HexDigit Digit5(HEX5, timee[15:12]);
wire [31:0] timee;

time_counter t1(.clk(CLOCK_50),.reset(~KEY[0] || zoom[0] || zoom_out32[1] || pan32[2]),.end_time(done),.count(timee));


// VGA clock and reset lines
wire vga_pll_lock ;
wire vga_pll ;
reg  vga_reset ;

// M10k memory control and data
reg 		[7:0] 	M10k_outt ;
reg 		[7:0] 	write_data ;
reg 		[18:0] 	write_address ;
reg 		[18:0] 	read_address ;
reg 					write_enable ;

// M10k memory clock
wire 					M10k_pll ;
wire 					M10k_pll_locked ;

// Memory writing control registers
reg 		[7:0] 	arbiter_state ;
reg 		[9:0] 	x_coord ;
reg 		[9:0] 	y_coord ;

// Wires for connecting VGA driver to memory
wire 		[9:0]		next_x ;
wire 		[9:0] 	next_y ;


//=====================================================our module down here==========


wire [7:0] color_reg_fed[28:0];
wire write_enable_from_mandel[28:0];
wire [18:0] write_addr_from_mandel[28:0];
wire [7:0] color_reg[28:0];
wire [5:0] stridee [28:0];
wire [4:0] shiftee[28:0];
wire [7:0] M10k_out [28:0];
wire doneee[28:0];



wire [31:0] zoom;
reg [28:0] done;
wire [31:0] pan32;
wire [31:0] zoom_out32;
wire [31:0] finish_render32;
wire [31:0] step_i32;
wire [31:0] step_r32;
wire [31:0] max_iterations32;
wire [31:0] ci_init32;
wire [31:0] cr_init32;




assign shiftee[0]=5'd0;
assign stridee[0]=6'd16;

assign shiftee[1]=5'd1;
assign stridee[1]=6'd16;

assign shiftee[2]=5'd2;
assign stridee[2]=6'd16;

assign shiftee[3]=5'd3;
assign stridee[3]=6'd32;

assign shiftee[4]=5'd4;
assign stridee[4]=6'd32;

assign shiftee[5]=5'd5;
assign stridee[5]=6'd32;

assign shiftee[6]=5'd6;
assign stridee[6]=6'd32;

assign shiftee[7]=5'd7;
assign stridee[7]=6'd32;

assign shiftee[8]=5'd8;
assign stridee[8]=6'd32;

assign shiftee[9]=5'd9;
assign stridee[9]=6'd32;

assign shiftee[10]=5'd10;
assign stridee[10]=6'd32;

assign shiftee[11]=5'd11;
assign stridee[11]=6'd32;

assign shiftee[12]=5'd12;
assign stridee[12]=6'd32;

assign shiftee[13]=5'd13;
assign stridee[13]=6'd32;

assign shiftee[14]=5'd14;
assign stridee[14]=6'd32;

assign shiftee[15]=5'd15;
assign stridee[15]=6'd32;

assign shiftee[19]=5'd19;
assign stridee[19]=6'd32;

assign shiftee[20]=5'd20;
assign stridee[20]=6'd32;

assign shiftee[21]=5'd21;
assign stridee[21]=6'd32;

assign shiftee[22]=5'd22;
assign stridee[22]=6'd32;

assign shiftee[23]=5'd23;
assign stridee[23]=6'd32;

assign shiftee[24]=5'd24;
assign stridee[24]=6'd32;

assign shiftee[25]=5'd25;
assign stridee[25]=6'd32;

assign shiftee[26]=5'd26;
assign stridee[26]=6'd32;

assign shiftee[27]=5'd27;
assign stridee[27]=6'd32;

assign shiftee[28]=5'd28;
assign stridee[28]=6'd32;

assign shiftee[16]=5'd29;
assign stridee[16]=6'd32;

assign shiftee[17]=5'd30;
assign stridee[17]=6'd32;

assign shiftee[18]=5'd31;
assign stridee[18]=6'd32;


//assign start_signal32=SW[0];

always@(posedge M10k_pll) begin
	if(~KEY[0] || zoom[0] || zoom_out32[1] || pan32[2]) begin
	done=29'd0;
																			end

	else begin
done[0]<=doneee[0];
done[1]<=doneee[1];
done[2]<=doneee[2];
done[3]<=doneee[3];
done[4]<=doneee[4];
done[5]<=doneee[5];
done[6]<=doneee[6];
done[7]<=doneee[7];
done[8]<=doneee[8];
done[9]<=doneee[9];
done[10]<=doneee[10];
done[11]<=doneee[11];
done[12]<=doneee[12];
done[13]<=doneee[13];
done[14]<=doneee[14];
done[15]<=doneee[15];
done[16]<=doneee[16];
done[17]<=doneee[17];
done[18]<=doneee[18];
done[19]<=doneee[19];
done[20]<=doneee[20];
done[21]<=doneee[21];
done[22]<=doneee[22];
done[23]<=doneee[23];
done[24]<=doneee[24];
done[25]<=doneee[25];
done[26]<=doneee[26];
done[27]<=doneee[27];
done[28]<=doneee[28];



			end


									end


assign finish_render32= timee;




	 wire [31:0] mouse_x;                  //              mouse_x.export
	wire [31:0] mouse_y; 
	wire [18:0] mouse_addr;	//              mouse_y.export

	wire [18:0] address_mandel;

	assign address_mandel=(19'd_640*next_y) + next_x;
	assign mouse_addr=(19'd_640*mouse_y[9:0]) + mouse_x[9:0];


//====================================================================================================


genvar i;

generate
for(i=3;i<29;i=i+1) begin : integ

mandel_integrator u_i (
.clk(CLOCK_50),
.reset(~KEY[0]),
.zoom_sig(zoom[0]),
.zoom_out(zoom_out32[1]),
.pan(pan32[2]),
.max_iterations(max_iterations32[9:0]),
.ci_init(ci_init32[26:0]),
.cr_init(cr_init32[26:0]),
.step_r(step_r32[26:0]),
.step_i(step_i32[26:0]),
.stride(stridee[i]),
.init_shift_y(shiftee[i]),
.donee(doneee[i]),
.stride_c(step_r32[26:0]*stridee[i]),
.init_shift_y_c(shiftee[i]*step_r32[26:0]),
.write_enable_mandel(write_enable_from_mandel[i]),
.write_addr_from_mandel(write_addr_from_mandel[i]),
.color_reg(color_reg[i]));


M10K_1000_8 pixel_data2(                                        .q(M10k_out[i]), // contains pixel color (8 bit) for display
								.d(color_reg_fed[i]),
								.write_address(write_addr_from_mandel[i][18:5]),
								.read_address(address_mandel[18:5]),
								.we(write_enable_from_mandel[i]),
								.clk(M10k_pll)
);




assign color_reg_fed[i]=(write_addr_from_mandel[i][18:5]==mouse_addr[18:5])? 8'b_111_111_11: color_reg[i]; 

end

endgenerate


genvar k;

generate
for(k=0;k<3;k=k+1) begin : intege

mandel_integrator u_i (
.clk(CLOCK_50),
.reset(~KEY[0]),
.zoom_sig(zoom[0]),
.zoom_out(zoom_out32[1]),
.pan(pan32[2]),
.max_iterations(max_iterations32[9:0]),
.ci_init(ci_init32[26:0]),
.cr_init(cr_init32[26:0]),
.step_r(step_r32[26:0]),
.step_i(step_i32[26:0]),
.stride(stridee[k]),
.init_shift_y(shiftee[k]),
.donee(doneee[k]),
.stride_c(step_r32[26:0]*stridee[k]),
.init_shift_y_c(shiftee[k]*step_r32[26:0]),
.write_enable_mandel(write_enable_from_mandel[k]),
.write_addr_from_mandel(write_addr_from_mandel[k]),
.color_reg(color_reg[k]));


M10K_1000_8_2 pixel_data2(                                        .q(M10k_out[k]), // contains pixel color (8 bit) for display
								.d(color_reg_fed[k]),
								.write_address(write_addr_from_mandel[k][18:4]),
								.read_address(address_mandel[18:4]),
								.we(write_enable_from_mandel[k]),
								.clk(M10k_pll)
);




assign color_reg_fed[k]=(write_addr_from_mandel[k][18:5]==mouse_addr[18:5])? 8'b_111_111_11: color_reg[k]; 

end

endgenerate



always@(address_mandel) begin

case(address_mandel[4:0])
 5'd0 : M10k_outt=M10k_out[0];
 5'd1 : M10k_outt=M10k_out[1];
 5'd2 : M10k_outt=M10k_out[2];
 5'd3 : M10k_outt=M10k_out[3];
 5'd4 : M10k_outt=M10k_out[4];
 5'd5 : M10k_outt=M10k_out[5];
 5'd6 : M10k_outt=M10k_out[6];
 5'd7 : M10k_outt=M10k_out[7];
 5'd8 : M10k_outt=M10k_out[8];
 5'd9 : M10k_outt=M10k_out[9];
5'd10 : M10k_outt=M10k_out[10];
5'd11 : M10k_outt=M10k_out[11];
5'd12 : M10k_outt=M10k_out[12];
5'd13 : M10k_outt=M10k_out[13];
5'd14 : M10k_outt=M10k_out[14];
5'd15 : M10k_outt=M10k_out[15];
5'd16 : M10k_outt=M10k_out[0];
5'd17 : M10k_outt=M10k_out[1];
5'd18 : M10k_outt=M10k_out[2];
5'd19 : M10k_outt=M10k_out[19];
5'd20 : M10k_outt=M10k_out[20];
5'd21 : M10k_outt=M10k_out[21];
5'd22 : M10k_outt=M10k_out[22];
5'd23 : M10k_outt=M10k_out[23];
5'd24 : M10k_outt=M10k_out[24];
5'd25 : M10k_outt=M10k_out[25];
5'd26 : M10k_outt=M10k_out[26];
5'd27 : M10k_outt=M10k_out[27];
5'd28 : M10k_outt=M10k_out[28];
5'd29 : M10k_outt=M10k_out[16];
5'd30 : M10k_outt=M10k_out[17];
5'd31 : M10k_outt=M10k_out[18];

endcase
end



//====================================================================================================

// Instantiate VGA driver					
vga_driver DUT   (	.clock(vga_pll), 
							.reset(vga_reset),
							.color_in(M10k_outt),	// Pixel color (8-bit) from memory
							.next_x(next_x),		// This (and next_y) used to specify memory read address
							.next_y(next_y),		// This (and next_x) used to specify memory read address
							.hsync(VGA_HS),
							.vsync(VGA_VS),
							.red(VGA_R),
							.green(VGA_G),
							.blue(VGA_B),
							.sync(VGA_SYNC_N),
							.clk(VGA_CLK),
							.blank(VGA_BLANK_N)
);


//=======================================================
//  Structural coding
//=======================================================
// From Qsys

Computer_System The_System (
	////////////////////////////////////
	// FPGA Side
	////////////////////////////////////
	.vga_pio_locked_export			(vga_pll_lock),           //       vga_pio_locked.export
	.vga_pio_outclk0_clk				(vga_pll),              //      vga_pio_outclk0.clk
	.m10k_pll_locked_export			(M10k_pll_locked),          //      m10k_pll_locked.export
	.m10k_pll_outclk0_clk			(M10k_pll),            //     m10k_pll_outclk0.clk

	// Global signals
	.system_pll_ref_clk_clk					(CLOCK_50),
	.system_pll_ref_reset_reset			(1'b0),
	

	////////////////////////////////////
	// HPS Side
	////////////////////////////////////
	// DDR3 SDRAM
	.memory_mem_a			(HPS_DDR3_ADDR),
	.memory_mem_ba			(HPS_DDR3_BA),
	.memory_mem_ck			(HPS_DDR3_CK_P),
	.memory_mem_ck_n		(HPS_DDR3_CK_N),
	.memory_mem_cke		(HPS_DDR3_CKE),
	.memory_mem_cs_n		(HPS_DDR3_CS_N),
	.memory_mem_ras_n		(HPS_DDR3_RAS_N),
	.memory_mem_cas_n		(HPS_DDR3_CAS_N),
	.memory_mem_we_n		(HPS_DDR3_WE_N),
	.memory_mem_reset_n	(HPS_DDR3_RESET_N),
	.memory_mem_dq			(HPS_DDR3_DQ),
	.memory_mem_dqs		(HPS_DDR3_DQS_P),
	.memory_mem_dqs_n		(HPS_DDR3_DQS_N),
	.memory_mem_odt		(HPS_DDR3_ODT),
	.memory_mem_dm			(HPS_DDR3_DM),
	.memory_oct_rzqin		(HPS_DDR3_RZQ),
	.mouse_x_export(mouse_x),                  //              mouse_x.export
	.mouse_y_export(mouse_y),                  //              mouse_y.export
   .zoom_export(zoom),
	.zoom_out_export(zoom_out32),
	.step_i_export(step_i32),
	.step_r_export(step_r32),
	.max_iterations_export(max_iterations32),
	.ci_initial_export(ci_init32),
	.cr_initial_export(cr_init32),
	.pan_export(pan32),
	.finish_render_export(finish_render32),
	.reset_mandel_export({31'd0,KEY[0]}),
	
	// Ethernet
	.hps_io_hps_io_gpio_inst_GPIO35	(HPS_ENET_INT_N),
	.hps_io_hps_io_emac1_inst_TX_CLK	(HPS_ENET_GTX_CLK),
	.hps_io_hps_io_emac1_inst_TXD0	(HPS_ENET_TX_DATA[0]),
	.hps_io_hps_io_emac1_inst_TXD1	(HPS_ENET_TX_DATA[1]),
	.hps_io_hps_io_emac1_inst_TXD2	(HPS_ENET_TX_DATA[2]),
	.hps_io_hps_io_emac1_inst_TXD3	(HPS_ENET_TX_DATA[3]),
	.hps_io_hps_io_emac1_inst_RXD0	(HPS_ENET_RX_DATA[0]),
	.hps_io_hps_io_emac1_inst_MDIO	(HPS_ENET_MDIO),
	.hps_io_hps_io_emac1_inst_MDC		(HPS_ENET_MDC),
	.hps_io_hps_io_emac1_inst_RX_CTL	(HPS_ENET_RX_DV),
	.hps_io_hps_io_emac1_inst_TX_CTL	(HPS_ENET_TX_EN),
	.hps_io_hps_io_emac1_inst_RX_CLK	(HPS_ENET_RX_CLK),
	.hps_io_hps_io_emac1_inst_RXD1	(HPS_ENET_RX_DATA[1]),
	.hps_io_hps_io_emac1_inst_RXD2	(HPS_ENET_RX_DATA[2]),
	.hps_io_hps_io_emac1_inst_RXD3	(HPS_ENET_RX_DATA[3]),

	// Flash
	.hps_io_hps_io_qspi_inst_IO0	(HPS_FLASH_DATA[0]),
	.hps_io_hps_io_qspi_inst_IO1	(HPS_FLASH_DATA[1]),
	.hps_io_hps_io_qspi_inst_IO2	(HPS_FLASH_DATA[2]),
	.hps_io_hps_io_qspi_inst_IO3	(HPS_FLASH_DATA[3]),
	.hps_io_hps_io_qspi_inst_SS0	(HPS_FLASH_NCSO),
	.hps_io_hps_io_qspi_inst_CLK	(HPS_FLASH_DCLK),

	// Accelerometer
	.hps_io_hps_io_gpio_inst_GPIO61	(HPS_GSENSOR_INT),

	//.adc_sclk                        (ADC_SCLK),
	//.adc_cs_n                        (ADC_CS_N),
	//.adc_dout                        (ADC_DOUT),
	//.adc_din                         (ADC_DIN),

	// General Purpose I/O
	.hps_io_hps_io_gpio_inst_GPIO40	(HPS_GPIO[0]),
	.hps_io_hps_io_gpio_inst_GPIO41	(HPS_GPIO[1]),

	// I2C
	.hps_io_hps_io_gpio_inst_GPIO48	(HPS_I2C_CONTROL),
	.hps_io_hps_io_i2c0_inst_SDA		(HPS_I2C1_SDAT),
	.hps_io_hps_io_i2c0_inst_SCL		(HPS_I2C1_SCLK),
	.hps_io_hps_io_i2c1_inst_SDA		(HPS_I2C2_SDAT),
	.hps_io_hps_io_i2c1_inst_SCL		(HPS_I2C2_SCLK),

	// Pushbutton
	.hps_io_hps_io_gpio_inst_GPIO54	(HPS_KEY),

	// LED
	.hps_io_hps_io_gpio_inst_GPIO53	(HPS_LED),

	// SD Card
	.hps_io_hps_io_sdio_inst_CMD	(HPS_SD_CMD),
	.hps_io_hps_io_sdio_inst_D0	(HPS_SD_DATA[0]),
	.hps_io_hps_io_sdio_inst_D1	(HPS_SD_DATA[1]),
	.hps_io_hps_io_sdio_inst_CLK	(HPS_SD_CLK),
	.hps_io_hps_io_sdio_inst_D2	(HPS_SD_DATA[2]),
	.hps_io_hps_io_sdio_inst_D3	(HPS_SD_DATA[3]),

	// SPI
	.hps_io_hps_io_spim1_inst_CLK		(HPS_SPIM_CLK),
	.hps_io_hps_io_spim1_inst_MOSI	(HPS_SPIM_MOSI),
	.hps_io_hps_io_spim1_inst_MISO	(HPS_SPIM_MISO),
	.hps_io_hps_io_spim1_inst_SS0		(HPS_SPIM_SS),

	// UART
	.hps_io_hps_io_uart0_inst_RX	(HPS_UART_RX),
	.hps_io_hps_io_uart0_inst_TX	(HPS_UART_TX),

	// USB
	.hps_io_hps_io_gpio_inst_GPIO09	(HPS_CONV_USB_N),
	.hps_io_hps_io_usb1_inst_D0		(HPS_USB_DATA[0]),
	.hps_io_hps_io_usb1_inst_D1		(HPS_USB_DATA[1]),
	.hps_io_hps_io_usb1_inst_D2		(HPS_USB_DATA[2]),
	.hps_io_hps_io_usb1_inst_D3		(HPS_USB_DATA[3]),
	.hps_io_hps_io_usb1_inst_D4		(HPS_USB_DATA[4]),
	.hps_io_hps_io_usb1_inst_D5		(HPS_USB_DATA[5]),
	.hps_io_hps_io_usb1_inst_D6		(HPS_USB_DATA[6]),
	.hps_io_hps_io_usb1_inst_D7		(HPS_USB_DATA[7]),
	.hps_io_hps_io_usb1_inst_CLK		(HPS_USB_CLKOUT),
	.hps_io_hps_io_usb1_inst_STP		(HPS_USB_STP),
	.hps_io_hps_io_usb1_inst_DIR		(HPS_USB_DIR),
	.hps_io_hps_io_usb1_inst_NXT		(HPS_USB_NXT)
);
endmodule // end top level

// Declaration of module, include width and signedness of each input/output
module vga_driver (
	input wire clock,
	input wire reset,
	input [7:0] color_in,
	output [9:0] next_x,
	output [9:0] next_y,
	output wire hsync,
	output wire vsync,
	output [7:0] red,
	output [7:0] green,
	output [7:0] blue,
	output sync,
	output clk,
	output blank
);
	
	// Horizontal parameters (measured in clock cycles)
	parameter [9:0] H_ACTIVE  	=  10'd_639 ;
	parameter [9:0] H_FRONT 	=  10'd_15 ;
	parameter [9:0] H_PULSE		=  10'd_95 ;
	parameter [9:0] H_BACK 		=  10'd_47 ;

	// Vertical parameters (measured in lines)
	parameter [9:0] V_ACTIVE  	=  10'd_479 ;
	parameter [9:0] V_FRONT 	=  10'd_9 ;
	parameter [9:0] V_PULSE		=  10'd_1 ;
	parameter [9:0] V_BACK 		=  10'd_32 ;

//	// Horizontal parameters (measured in clock cycles)
//	parameter [9:0] H_ACTIVE  	=  10'd_9 ;
//	parameter [9:0] H_FRONT 	=  10'd_4 ;
//	parameter [9:0] H_PULSE		=  10'd_4 ;
//	parameter [9:0] H_BACK 		=  10'd_4 ;
//	parameter [9:0] H_TOTAL 	=  10'd_799 ;
//
//	// Vertical parameters (measured in lines)
//	parameter [9:0] V_ACTIVE  	=  10'd_1 ;
//	parameter [9:0] V_FRONT 	=  10'd_1 ;
//	parameter [9:0] V_PULSE		=  10'd_1 ;
//	parameter [9:0] V_BACK 		=  10'd_1 ;

	// Parameters for readability
	parameter 	LOW 	= 1'b_0 ;
	parameter 	HIGH	= 1'b_1 ;

	// States (more readable)
	parameter 	[7:0]	H_ACTIVE_STATE 		= 8'd_0 ;
	parameter 	[7:0] 	H_FRONT_STATE		= 8'd_1 ;
	parameter 	[7:0] 	H_PULSE_STATE 		= 8'd_2 ;
	parameter 	[7:0] 	H_BACK_STATE 		= 8'd_3 ;

	parameter 	[7:0]	V_ACTIVE_STATE 		= 8'd_0 ;
	parameter 	[7:0] 	V_FRONT_STATE		= 8'd_1 ;
	parameter 	[7:0] 	V_PULSE_STATE 		= 8'd_2 ;
	parameter 	[7:0] 	V_BACK_STATE 		= 8'd_3 ;

	// Clocked registers
	reg 		hysnc_reg ;
	reg 		vsync_reg ;
	reg 	[7:0]	red_reg ;
	reg 	[7:0]	green_reg ;
	reg 	[7:0]	blue_reg ;
	reg 		line_done ;

	// Control registers
	reg 	[9:0] 	h_counter ;
	reg 	[9:0] 	v_counter ;

	reg 	[7:0]	h_state ;
	reg 	[7:0]	v_state ;

	// State machine
	always@(posedge clock) begin
		// At reset . . .
  		if (reset) begin
			// Zero the counters
			h_counter 	<= 10'd_0 ;
			v_counter 	<= 10'd_0 ;
			// States to ACTIVE
			h_state 	<= H_ACTIVE_STATE  ;
			v_state 	<= V_ACTIVE_STATE  ;
			// Deassert line done
			line_done 	<= LOW ;
  		end
  		else begin
			//////////////////////////////////////////////////////////////////////////
			///////////////////////// HORIZONTAL /////////////////////////////////////
			//////////////////////////////////////////////////////////////////////////
			if (h_state == H_ACTIVE_STATE) begin
				// Iterate horizontal counter, zero at end of ACTIVE mode
				h_counter <= (h_counter==H_ACTIVE)?10'd_0:(h_counter + 10'd_1) ;
				// Set hsync
				hysnc_reg <= HIGH ;
				// Deassert line done
				line_done <= LOW ;
				// State transition
				h_state <= (h_counter == H_ACTIVE)?H_FRONT_STATE:H_ACTIVE_STATE ;
			end
			// Assert done flag, wait here for reset
			if (h_state == H_FRONT_STATE) begin
				// Iterate horizontal counter, zero at end of H_FRONT mode
				h_counter <= (h_counter==H_FRONT)?10'd_0:(h_counter + 10'd_1) ;
				// Set hsync
				hysnc_reg <= HIGH ;
				// State transition
				h_state <= (h_counter == H_FRONT)?H_PULSE_STATE:H_FRONT_STATE ;
			end
			if (h_state == H_PULSE_STATE) begin
				// Iterate horizontal counter, zero at end of H_FRONT mode
				h_counter <= (h_counter==H_PULSE)?10'd_0:(h_counter + 10'd_1) ;
				// Set hsync
				hysnc_reg <= LOW ;
				// State transition
				h_state <= (h_counter == H_PULSE)?H_BACK_STATE:H_PULSE_STATE ;
			end
			if (h_state == H_BACK_STATE) begin
				// Iterate horizontal counter, zero at end of H_FRONT mode
				h_counter <= (h_counter==H_BACK)?10'd_0:(h_counter + 10'd_1) ;
				// Set hsync
				hysnc_reg <= HIGH ;
				// State transition
				h_state <= (h_counter == H_BACK)?H_ACTIVE_STATE:H_BACK_STATE ;
				// Signal line complete at state transition (offset by 1 for synchronous state transition)
				line_done <= (h_counter == (H_BACK-1))?HIGH:LOW ;
			end
			//////////////////////////////////////////////////////////////////////////
			///////////////////////// VERTICAL ///////////////////////////////////////
			//////////////////////////////////////////////////////////////////////////
			if (v_state == V_ACTIVE_STATE) begin
				// increment vertical counter at end of line, zero on state transition
				v_counter <= (line_done==HIGH)?((v_counter==V_ACTIVE)?10'd_0:(v_counter + 10'd_1)):v_counter ;
				// set vsync in active mode
				vsync_reg <= HIGH ;
				// state transition - only on end of lines
				v_state <= (line_done==HIGH)?((v_counter==V_ACTIVE)?V_FRONT_STATE:V_ACTIVE_STATE):V_ACTIVE_STATE ;
			end
			if (v_state == V_FRONT_STATE) begin
				// increment vertical counter at end of line, zero on state transition
				v_counter <= (line_done==HIGH)?((v_counter==V_FRONT)?10'd_0:(v_counter + 10'd_1)):v_counter ;
				// set vsync in front porch
				vsync_reg <= HIGH ;
				// state transition
				v_state <= (line_done==HIGH)?((v_counter==V_FRONT)?V_PULSE_STATE:V_FRONT_STATE):V_FRONT_STATE ;
			end
			if (v_state == V_PULSE_STATE) begin
				// increment vertical counter at end of line, zero on state transition
				v_counter <= (line_done==HIGH)?((v_counter==V_PULSE)?10'd_0:(v_counter + 10'd_1)):v_counter ;
				// clear vsync in pulse
				vsync_reg <= LOW ;
				// state transition
				v_state <= (line_done==HIGH)?((v_counter==V_PULSE)?V_BACK_STATE:V_PULSE_STATE):V_PULSE_STATE ;
			end
			if (v_state == V_BACK_STATE) begin
				// increment vertical counter at end of line, zero on state transition
				v_counter <= (line_done==HIGH)?((v_counter==V_BACK)?10'd_0:(v_counter + 10'd_1)):v_counter ;
				// set vsync in back porch
				vsync_reg <= HIGH ;
				// state transition
				v_state <= (line_done==HIGH)?((v_counter==V_BACK)?V_ACTIVE_STATE:V_BACK_STATE):V_BACK_STATE ;
			end

			//////////////////////////////////////////////////////////////////////////
			//////////////////////////////// COLOR OUT ///////////////////////////////
			//////////////////////////////////////////////////////////////////////////
			red_reg 		<= (h_state==H_ACTIVE_STATE)?((v_state==V_ACTIVE_STATE)?{color_in[7:5],5'd_0}:8'd_0):8'd_0 ;
			green_reg 	<= (h_state==H_ACTIVE_STATE)?((v_state==V_ACTIVE_STATE)?{color_in[4:2],5'd_0}:8'd_0):8'd_0 ;
			blue_reg 	<= (h_state==H_ACTIVE_STATE)?((v_state==V_ACTIVE_STATE)?{color_in[1:0],6'd_0}:8'd_0):8'd_0 ;
			
 	 	end
	end
	// Assign output values
	assign hsync = hysnc_reg ;
	assign vsync = vsync_reg ;
	assign red = red_reg ;
	assign green = green_reg ;
	assign blue = blue_reg ;
	assign clk = clock ;
	assign sync = 1'b_0 ;
	assign blank = hysnc_reg & vsync_reg ;
	// The x/y coordinates that should be available on the NEXT cycle
	assign next_x = (h_state==H_ACTIVE_STATE)?h_counter:10'd_0 ;
	assign next_y = (v_state==V_ACTIVE_STATE)?v_counter:10'd_0 ;

endmodule




//============================================================
// M10K module for testing
//============================================================
// See example 12-16 in 
// http://people.ece.cornell.edu/land/courses/ece5760/DE1_SOC/HDL_style_qts_qii51007.pdf
//============================================================





module M10K_1000_8( 
    output reg [7:0] q,
    input [7:0] d,
    input [13:0] write_address, read_address,
    input we, clk
);
	 // force M10K ram style
	 // 307200 words of 8 bits
    reg [7:0] mem [9460:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
		  end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module M10K_1000_8_2( 
    output reg [7:0] q,
    input [7:0] d,
    input [14:0] write_address, read_address,
    input we, clk
);
	 // force M10K ram style
	 // 307200 words of 8 bits
    reg [7:0] mem [18920:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
		  end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule


module time_counter(
input clk,
input reset,
input [28:0] end_time,
output reg [31:0]count);

always@(posedge clk) begin
if(reset==1) begin
count<=32'd0;
end
else if(end_time==29'b11111111111111111111111111111)begin
count<=count;
end
else begin
count<=count+32'd1;
end
 
 
end

endmodule




module mandel_integrator(
input clk,
input reset,
input zoom_sig,
input zoom_out,
input pan,
input [9:0]  max_iterations,
input signed [26:0] ci_init,
input signed [26:0] cr_init,
input signed [26:0] step_r,
input signed [26:0] step_i,
input [5:0] stride,
input [4:0] init_shift_y,
input [26:0] stride_c,
input [26:0] init_shift_y_c,
output reg donee,
output write_enable_mandel,
output reg [18:0] write_addr_from_mandel,
output reg [7:0] color_reg);


      //  wire signed [26:0] ci;
	// wire signed [26:0] cr;
         //wire signed [26:0] multi;
         //wire signed [26:0] multr;
	 wire signed [26:0] zn_plusone_i;
	 wire signed [26:0] zn_plusone_r;
	 wire signed [26:0] zn_plusone_r_square;
	 wire signed [26:0] zn_plusone_i_square;
         wire signed [26:0] mult_out_f; 
        //reg signed [26:0] shift_wire;
         //wire signed [26:0] stride_wire;
              

         //reg signed [26:0] step_r;
        // reg signed [26:0] step_i;
         reg signed [26:0] x;
         reg signed [26:0] y;
       
	 reg signed [26:0] zni;
	 reg signed [26:0] znr;
 	 reg signed [26:0] znr_square;
	 reg signed [26:0] zni_square;
	reg signed [26:0] color_out;
        
		
        parameter blue= 27'd1;        
	parameter reset_state= 2'b00;
	parameter start_state= 2'b01;
	parameter run_state= 2'b10;
	parameter read_state= 2'b11;
       // parameter step_i_size= 27'd34952;
        //parameter step_r_size = 27'd39321;
	 //max_iterations= 10'd1000;
     
        reg [1:0] state;
       
        reg finish;
	reg [9:0] count;
	reg write_enable;
 	//reg signed [26:0] ci_init;
	//reg signed [26:0] cr_init;
        reg zoom_debounce;
	reg signed [26:0] ci_reg;
	reg signed [26:0] cr_reg;
	reg zoomout_debounce;
	reg pan_debounce;
	//reg signed [26:0] ci_mouse;
	//reg signed [26:0] cr_mouse;
     
	
        signed_mult s4(.out(zn_plusone_r_square),.a(zn_plusone_r),.b(zn_plusone_r));
	signed_mult s5(.out(mult_out_f),.a(znr),.b(zni));
        signed_mult s6(.out(zn_plusone_i_square),.a(zn_plusone_i),.b(zn_plusone_i));

	//assign ci= 27'd8388608 - y*step_i;
       //assign cr= -27'sd16777216 + x*step_r ;
	//assign ci= ci_init - y*step_i;
     // assign cr= cr_init + x*step_r ;
        assign zn_plusone_i=((mult_out_f)<<<1)+ci_reg;
        assign zn_plusone_r=znr_square-zni_square+cr_reg;
        assign write_enable_mandel=write_enable;
        //assign stride_wire={22'd0,stride[4:0]}<<<23;
	//assign shift_wire=step_i_size*init_shift_y[4:0];
   

		always@(posedge clk)
		begin
		write_addr_from_mandel=(19'd640*y[9:0]) + x[9:0];
		end


   
    

       //state machine
       always@(posedge clk) begin

        if(reset) begin
	state<=2'd0;
         zoom_debounce<=1'b0;
         zoomout_debounce<=1'b0;
	 pan_debounce<=1'b0;
         write_enable<=1'b0;
         color_reg<=8'd0;
			donee<=1'b0;
	//step_i<=step_i_size;  
	 //ci_mouse<=27'd8388608;
	// cr_mouse<=-27'sd16777216;
       //   step_r<=step_r_size; 
            // ci_init<=27'd8388608;
		//cr_init<=-27'sd16777216;
 			//shift_wire<=27'd8388608+step_i_size*{22'd0,init_shift_y};
                
        //next_state<=2'd0;
		end
//=================================zoom in logic===========
     if(zoom_sig && zoom_debounce==1'b0) begin
	state<=2'd0;
           write_enable<=1'b0;
              color_reg<=8'd0;
				  donee<=1'b0;
       //ci_init<=ci_mouse;
		//cr_init<=cr_mouse;
	//step_i<=step_i>>1;    
              //    step_r<=step_r>>1; 
               zoom_debounce<=1'b1;
        //next_state<=2'd0;
		end
//=================================zoom out logic===========
	if(zoom_out && zoomout_debounce==1'b0) begin
	state<=2'd0;
           write_enable<=1'b0;
              color_reg<=8'd0;
				  donee<=1'b0;
      // ci_init<=ci_mouse;
		//cr_init<=cr_mouse;
	//step_i<=step_i<<1;    
             //     step_r<=step_r<<1; 
               zoomout_debounce<=1'b1;
        //next_state<=2'd0;
		end
//=================================pan logic===========
     if(pan && pan_debounce==1'b0) begin
	state<=2'd0;
           write_enable<=1'b0;
              color_reg<=8'd0;
				  donee<=1'b0;
 		/*if(x_mouse==10'd0) begin
                 cr_init<=cr_init - (step_r<<8);
		end
		if(x_mouse==10'd639) begin
                 cr_init<=cr_init + (step_r<<8);
		end
 		if(y_mouse==10'd0) begin
                 ci_init<=ci_init + (step_i<<8);
		end
		if(y_mouse==10'd479) begin
                 ci_init<=ci_init - (step_i<<8);
		end */
 
	 pan_debounce<=1'b1;
       
        //next_state<=2'd0;
		end


        else if(zoom_sig==0 && reset==0 && zoom_out==0 && pan==0) begin
       zoom_debounce<=1'b0;
       zoomout_debounce<=1'b0;
	pan_debounce<=1'b0;
          case(state) 

  reset_state: begin
	if(!reset) begin
	
	//if(x==x_mouse && y==y_mouse)begin
			//ci_mouse<=ci_reg;
			//cr_mouse<=cr_reg;	
				//	end
                  y<=27'd0;
                  x<={22'd0,init_shift_y};  
                        ci_reg<=ci_init;
			cr_reg<=cr_init+ init_shift_y_c;
			count<=10'd1;
                finish<=1'b0;
			//ci_mouse<=ci_init;
			//cr_mouse<=cr_init;
		//next_state<=start_state;	
                 state<=run_state;
                
                  //local_zout<=27'd0;
			end
		end


  start_state: begin
               count<=10'd1;
                finish<=1'b0;
              
                //start<=1'b1;
                //next_state<=run_state;
                   state<=run_state;
               end
 

  run_state: begin
                if(finish==1'b0) begin
			
                        state<=run_state;
                	if(!(count>max_iterations || ((zn_plusone_r_square)+(zn_plusone_i_square))>27'sd33554432 || zn_plusone_r>27'sd16777216 || zn_plusone_i>27'sd16777216 || zn_plusone_r < -27'sd16777216 || zn_plusone_i< -27'sd16777216 )) begin
                 	count<=count+10'd1;
                	 
                  	  end
                 	  if(count>max_iterations) 
				begin
				color_out<={17'd0,count};
                   	      finish<=1'b1;
                              write_enable<=1'b1;
				color_reg <= 8'b_000_000_00 ;

				end
			if(((zn_plusone_r_square)+(zn_plusone_i_square))>27'd33554432 || zn_plusone_r>27'sd16777216 || zn_plusone_i>27'sd16777216  || zn_plusone_r< -27'sd16777216 || zn_plusone_i< -27'sd16777216) 
				begin
				color_out<={17'd0,count};
				finish<=1'b1;
                                  write_enable<=1'b1;


				if (count >= (max_iterations >>> 1)) begin
					  color_reg <= 8'b_011_001_00 ; // white
						end
				else if (count >= (max_iterations >>> 2)) begin
 				 color_reg <= 8'b_011_001_00 ;
					end
					else if (count >= (max_iterations >>> 3)) begin
  					color_reg <= 8'b_101_010_01 ;
					end
				else if (count >= (max_iterations >>> 4)) begin
 						 color_reg <= 8'b_011_001_01 ;
						end
					else if (count >= (max_iterations >>> 5)) begin
 					 color_reg <= 8'b_001_001_01 ;
						end
				else if (count >= (max_iterations >>> 6)) begin
  					color_reg <= 8'b_011_010_10 ;
						end
				else if (count >= (max_iterations >>> 7)) begin
  					color_reg <= 8'b_010_100_10 ;
						end
					else if (count >= (max_iterations >>> 8)) begin
 					 color_reg <= 8'b_010_100_10 ;
						end
							else begin
 						 color_reg <= 8'b_010_100_10 ;
								end




 				end
                               end

               if(finish==1'b1) begin
               
               state<=read_state;
                                end
       	end


  read_state: begin
	if(y<27'd480 )
		 begin					
		    if(x>=27'd640) 
		      begin
		      y<=y+27'd1;
			ci_reg<=ci_reg-step_i;
	              x={22'd0,init_shift_y};
                      cr_reg<=cr_init + init_shift_y_c;  // + {22'd0,init_shift_y}*step_r;
                          state<=start_state;
                            write_enable<=1'b0;   
	              end
	            else begin 
	              x<=x+{21'd0,stride};
			
                      cr_reg<=cr_reg+stride_c;
                      state<=start_state;
                        write_enable<=1'b0;
                       
	              end

	           end
        else begin
            donee<=1'b1;
             state<=reset_state;
               end   
	     end

                              
	endcase
end
     end




//register feedback=====================================

	always@(posedge clk) begin

       if(state==start_state) begin
        
		zni<=27'b0;
		znr<=27'b0;
		znr_square<=27'b0;
		zni_square<=27'b0;

 
        end

	if(finish==1'b0) begin
	znr<=zn_plusone_r;
	zni<=zn_plusone_i;
	znr_square<=zn_plusone_r_square;
	zni_square<=zn_plusone_i_square;
		end
	end



endmodule

	     
	
//////////////////////////////////////////////////
//// signed mult of 4.23 format 2'comp////////////
//////////////////////////////////////////////////

module signed_mult (out, a, b);
	output 	signed  [26:0]	out;
	input 	signed	[26:0] 	a;
	input 	signed	[26:0] 	b;
	// intermediate full bit length
	wire 	signed	[53:0]	mult_out;
	assign mult_out = a * b;
	// select bits for 4.23 fixed point
	assign out = {mult_out[53], mult_out[48:23]};
endmodule
/////////////////////////////////////////