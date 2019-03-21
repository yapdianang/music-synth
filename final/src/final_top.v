module final_top(
    /*
	 'define H_SYNC_PULSE 112
	 'define H_BACK_PORCH 248
	 'define H_FRONT_PORCH 48
	 'define V_SYNC_PULSE 3
	 'define V_BACK_PORCH 38
	 'define V_FRONT_PORCH 1
*/ 	 
	 
	 // Clock
    input clk_100,
	 
	 
    // ADAU_1761 interface
    output  AC_ADR0,            // I2C Address pin (DO NOT CHANGE)
    output  AC_ADR1,            // I2C Address pin (DO NOT CHANGE)

    output  AC_GPIO0,           // I2S Signals
    input   AC_GPIO1,           // I2S Signals
    input   AC_GPIO2,           // I2S Byte Clock
    input   AC_GPIO3,           // I2S Channel Clock

    output  AC_MCLK,            // Master clock (48MHz)
    output  AC_SCK,             // I2C SCK
    inout   AC_SDA,             // I2C SDA 

    // LEDs
    output wire [3:0] leds_l,
    output wire [3:0] leds_r,
    // DVI Interface
    
    // I2C
    output HDMI_SCL,
    inout  HDMI_SDA,
	 
	 output hdmi_clk,
	 output hdmi_hsync,
	 output hdmi_vsync,
	 output [15:0] hdmi_d,
	 output hdmi_de, 
	 // input hdmi_int, 
	 
	 // input [8:1] sw,
    input btn_up,
    input btn_left,
    input btn_right,
    input btn_down,
	 
	 // toggles on board
	 input [7:0] sw,

    // pmod Keypad
    inout [7:0] pmod_kypd,
	 
	 // rotary encoder
	 input [7:4] JE,
	 

    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B, 
    output VGA_HS,
    output VGA_VS
);  
    // button_press_unit's WIDTH parameter is exposed here so that you can
    // reduce it in simulation.  Setting it to 1 effectively disables it.
    parameter BPU_WIDTH = 20;
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000;

    // Our reset
    wire reset = btn_up;
   
    // These signals are for determining which color to display
    wire [11:0] x;  // [0..1279]
    wire [11:0]  y;  // [0..1023]   
    wire [11:0] x_q;
    wire [11:0] y_q; 	 
    // Color to display at the given x,y
    wire [7:0]  r, g, b;
    wire [7:0] r_1, g_1, b_1;
 
//   
//  ****************************************************************************
//      Button processor units
//  ****************************************************************************
//  

	wire [3:0] Decode;
	Decoder C0(
			.clk(clk_100),
			.Row(pmod_kypd[7:4]),
			.Col(pmod_kypd[3:0]), 
			.DecodeOut(Decode)
	);
	 
	 wire [4:0] EncO;
	Debouncer_rotary rd(
			.clk(clk_100),
			.Ain(JE[4]),
			.Bin(JE[5]),
			.Aout(AO),
			.Bout(BO)
	);
	
	Encoder_rotary er(
			.clk(clk_100),
			.A(AO),
			.B(BO),
			.BTN(JE[6]),
			.EncOut(EncO),
			.LED()
	);
	//assign leds_r = EncO[4:1];
	// these are to make the signals from the keypad one pulse, where one_pulse_kypd is the number that goes high for one cycle
	wire [3:0] one_pulse_kypd;

	edge_detector ed_0( 
			.sig(Decode[0]),
			.reset(reset),
			.clk(clk_100),
			.pe(one_pulse_kypd[0])
	);
	edge_detector ed_1(
			.sig(Decode[1]),
			.reset(reset),
			.clk(clk_100),
			.pe(one_pulse_kypd[1])
	);
	edge_detector ed_2(
			.sig(Decode[2]), 
			.reset(reset),
			.clk(clk_100),
			.pe(one_pulse_kypd[2])
	);
	edge_detector ed_3(
			.sig(Decode[3]),
			.reset(reset),			
			.clk(clk_100),
			.pe(one_pulse_kypd[3])
	); 

	wire next_delay, next_att;
    button_press_unit #(.WIDTH(BPU_WIDTH)) bpu_1(
        .clk(clk_100),
        .reset(reset),
        .in(sw[3]),
        .out(next_delay)
    );
	     button_press_unit #(.WIDTH(BPU_WIDTH)) bpu_2(
        .clk(clk_100),
        .reset(reset),
        .in(sw[2]),
        .out(next_att)
    );

	wire new_instrument = (one_pulse_kypd[0] | one_pulse_kypd[1] | one_pulse_kypd[2] | one_pulse_kypd[3]);

	//wire switch_speakers = (one_pulse_kypd == 4'b1111); // F
	
    wire play;
    button_press_unit #(.WIDTH(BPU_WIDTH)) play_button_press_unit(
        .clk(clk_100),
        .reset(reset),
        .in(btn_left),
        .out(play) 
    );

    wire next;
    button_press_unit #(.WIDTH(BPU_WIDTH)) next_button_press_unit(
        .clk(clk_100),
        .reset(reset),
        .in(btn_right),
        .out(next)
    );
       
//   
//  ****************************************************************************
//      The music player
//  ****************************************************************************
//       
wire new_frame;
wire signed [15:0] wave1_out, wave2_out, wave3_out;
wire pre_flopped_new_sample;
wire signed [15:0] pre_flopped_codec_sample;


music_player #(.BEAT_COUNT(BEAT_COUNT)) music_player(
	.clk(clk_100),
	.reset(reset), 
	.play_button(play),
	.next_button(next),
	.new_frame(new_frame), 
	.sample_out(pre_flopped_codec_sample),
	.new_sample_generated(pre_flopped_new_sample),
	.instruments(Decode),
	.new_instrument(new_instrument),
	.wave1_out(wave1_out),
	.wave2_out(wave2_out),
	.wave3_out(wave3_out),
	.speed_up(sw[4]),
	.rewind(sw[5])
);
	

wire new_sample;
wire signed [15:0] codec_sample;

dff #(.WIDTH(17)) mp_delay_ff(
	.clk(clk_100),
	.d({pre_flopped_new_sample, pre_flopped_codec_sample}),
	.q({new_sample, codec_sample})

);	

wire flopped_new_sample;
wire signed [15:0] flopped_codec_sample;
dff #(.WIDTH(17)) mp_delay_ff_2(
	.clk(clk_100),
	.d({new_sample, codec_sample}),
	.q({flopped_new_sample, flopped_codec_sample})

);	

wire signed [15:0] flopped_wave1, flopped_wave2, flopped_wave3;

 dff #(.WIDTH(16)) sample_reg1 (
	  .clk(clk_100),
	  .d(wave1_out),
	  .q({flopped_wave1})
 );
 dff #(.WIDTH(16)) sample_reg2 (
	  .clk(clk_100),
	  .d(wave2_out),
	  .q(flopped_wave2)
 );
 dff #(.WIDTH(16)) sample_reg3 (
	  .clk(clk_100),
	  .d(wave3_out),
	  .q(flopped_wave3)
 );
 
wire signed [15:0] adsr_out;
wire adsr_ready;

	 adsr local_adsr (
		.clk(clk_100),
		.reset(reset),
		.sample_in(codec_sample),
		.in_ready(new_sample),
		.sample_out(adsr_out),
		.out_ready (adsr_ready)
	 
	 );
	 
 wire signed [15:0] mux_sample;
 wire mux_ready;
 
	 assign mux_sample = sw[7]? adsr_out : flopped_codec_sample;
	 assign mux_ready = sw[7]? adsr_ready : flopped_new_sample;

	
wire signed [15:0] flopped_mux_sample;
wire flopped_mux_ready;

    dff #(.WIDTH(17)) sample_reg (
        .clk(clk_100),
        .d({mux_ready, mux_sample}),
        .q({flopped_mux_ready, flopped_mux_sample})
    );

wire signed [15:0] post_echoed_sample;
wire post_echoed_ready;
		
	 echo local_echo (
		.clk(clk_100),
		.reset (reset),
		.sample_in(flopped_mux_sample),
		.in_ready(flopped_mux_ready),
		.next_D (next_delay),
		.next_H (next_att),
		.out (post_echoed_sample),
		.out_ready (post_echoed_ready)
	  
	 );
	 
wire signed [15:0] flopped_echoed_sample;
wire flopped_echoed_ready;

    dff #(.WIDTH(17)) sample_reg_dff(
        .clk(clk_100),
        .d({post_echoed_ready, post_echoed_sample}),
        .q({flopped_echoed_ready, flopped_echoed_sample})
    );
	  

//   
//  ****************************************************************************
//      Codec interface
//  ****************************************************************************
//  

   wire [23:0] hphone_r = 0;
	wire [23:0] hphone_l = 0;
	wire [23:0] line_in_l = 0;  
	wire [23:0] line_in_r =  0; 
	
    // Output the sample onto the LEDs for the fun of it.
     assign leds_r = flopped_echoed_sample[15:12];
	  //assign leds_r = codec_sample[15:12];

    //assign leds_r = Decode;
	 
/*
    adau1761_codec adau1761_codec(
        .clk_100(clk_100),
        .reset(reset),
        .AC_ADR0(AC_ADR0),
        .AC_ADR1(AC_ADR1),
        .I2S_MISO(AC_GPIO0),
        .I2S_MOSI(AC_GPIO1),
        .I2S_bclk(AC_GPIO2),
        .I2S_LR(AC_GPIO3),
        .AC_MCLK(AC_MCLK),
        .AC_SCK(AC_SCK),
        .AC_SDA(AC_SDA),
        .hphone_l({codec_sample, 8'h00}),
        .hphone_r(hphone_r),
        .line_in_l(line_in_l),
        .line_in_r(line_in_r),
        .new_sample(new_frame)
    );  
*/    
	//wire [15:0] flopped_echoed_sample_75 = (flopped_echoed_sample << 1) + (flopped_echoed_sample << 2);
//	wire [15:0] flopped_echoed_sample_25 = (flopped_echoed_sample << 2);

//	  .hphone_l(sw[0] ? hphone_in - {19'b0, EncO, 8'b0} : hphone_l),
//	  .hphone_r(sw[1] ? hphone_in + {19'b0, EncO, 8'b0}: hphone_r),//
	  wire [23:0] hphone_in = {flopped_echoed_sample, 8'h00};
	  adau1761_codec echo_adau1761_codec(
	  .clk_100(clk_100),
	  .reset(reset),
	  .AC_ADR0(AC_ADR0),
	  .AC_ADR1(AC_ADR1),
	  .I2S_MISO(AC_GPIO0),
	  .I2S_MOSI(AC_GPIO1),
	  .I2S_bclk(AC_GPIO2),
	  .I2S_LR(AC_GPIO3),
	  .AC_MCLK(AC_MCLK),
	  .AC_SCK(AC_SCK),
	  .AC_SDA(AC_SDA),
	  .hphone_l(sw[0] ? hphone_in - {19'b0, EncO, 8'b0} : hphone_l),
	  .hphone_r(sw[1] ? hphone_in + {19'b0, EncO, 8'b0}: hphone_r),
	  .line_in_l(line_in_l),
	  .line_in_r(line_in_r),
	  .new_sample(new_frame)
    );  
//   
//  ****************************************************************************
//      Display management
//  ****************************************************************************
//  
    /* blinking leds to show life */
    wire [26:0] led_counter;

    dff #(.WIDTH (27)) led_div (
        .clk (clk_100),
        .d (led_counter + 27'd1),
        .q (led_counter)
    );
    assign leds_l = led_counter[26:23];
 
    //==========================================================================
    // Display management -> do not touch!
    //==========================================================================
	 
	 wire valid;
     wire valid_d; 
	 
	 
    vga_hdmi hdmi(
        .clk_100(clk_100),
        .color({r_1, g_1, b_1}),
        .vga_r(VGA_R),
        .vga_b(VGA_B),
        .vga_g(VGA_G),
        .vga_hs(VGA_HS),
        .vga_vs(VGA_VS),
        .hdmi_clk (hdmi_clk), 
          .hdmi_hsync (hdmi_hsync),
           .hdmi_vsync (hdmi_vsync), 
           .hdmi_d (hdmi_d), 
           .hdmi_de (hdmi_de),  
           .hdmi_scl (HDMI_SCL), 
           .xpos(x),
           .ypos(y),
           // .valid(valid_d),
           .valid(valid),
          .hdmi_sda (HDMI_SDA));
    

	wire [7:0] r_all, g_all, b_all, r_sub1, g_sub2, b_sub3;	  
    wave_display_top wd_top (
		.clk (clk_100),
		.reset (reset),
		.new_sample (flopped_echoed_ready),  
		.sample (flopped_echoed_sample),
		// .x(x_q[10:0]),
		// .y(y_q[9:0]),
        .x(x[10:0]),
        .y(y[9:0]),
		.valid(valid),
		.vsync(hdmi_vsync),
		.r(r_all),
		.g(g_all),
		.b(b_all) 
    );
	 
	  wave_display_top wd_top1 (
		.clk (clk_100),
		.reset (reset),
		.new_sample (new_sample),
		.sample (flopped_wave1),
		// .x(x_q[10:0]),
		// .y(y_q[9:0]),
        .x(x[10:0]),
        .y(y[9:0] - (EncO << 2)),
		.valid(valid),
		.vsync(hdmi_vsync),
		.r(r_sub1),
		.g(),
		.b() 
    );
	 
	  wave_display_top wd_top2 (
		.clk (clk_100),
		.reset (reset),
		.new_sample (new_sample),
		.sample (flopped_wave2),
		// .x(x_q[10:0]),
		// .y(y_q[9:0]),
        .x(x[10:0]),
        .y(y[9:0]- (EncO << 3)),
		.valid(valid),
		.vsync(hdmi_vsync),
		.r(),
		.g(g_sub2),
		.b() 
    );
    
	 wave_display_top wd_top3 (
		.clk (clk_100),
		.reset (reset),
		.new_sample (new_sample),
		.sample (flopped_wave3),
		// .x(x_q[10:0]),
		// .y(y_q[9:0]),
        .x(x[10:0]),
        .y(y[9:0] - (EncO << 4)),
		.valid(valid),
		.vsync(hdmi_vsync),
		.r(),
		.g(),
		.b(b_sub3) 
    );
	 
	 assign r_1 = r_sub1 + r_all;
	 assign g_1 = g_sub2 + g_all;
	 assign b_1 = b_sub3 + b_all;
	 

endmodule



	 // dff #(.WIDTH (12)) x_dff (
  //       .clk (clk_100),
  //       .d (x),
  //       .q (x_q)
		//   );
 
	 // dff #(.WIDTH (12)) y_dff (
  //       .clk (clk_100),
  //       .d (y),
  //       .q (y_q)
		//   );

  //    dff valid_dff(
  //       .clk(clk_100),
  //       .d(valid_d),
  //       .q(valid));
