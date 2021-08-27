/*
 Copyright (C) 2020  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and any partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details, at
 https://fpgasoftware.intel.com/eula.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Fast Corner delays for the design using part 10M08DAF484C8G
 with speed grade M, core voltage 1.2V, and temperature 0 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "Uart_16750";
DATE "07/31/2021 15:36:50";
PROGRAM "Quartus Prime";



INPUT RST;
INPUT A[2];
INPUT CLK;
INPUT CS;
INPUT WR;
INPUT A[1];
INPUT A[0];
INPUT DIN[5];
INPUT DIN[0];
INPUT DIN[1];
INPUT DIN[2];
INPUT RD;
INPUT DIN[7];
INPUT RCLK;
INPUT DIN[3];
INPUT DIN[6];
INPUT CTSN;
INPUT BAUDCE;
INPUT DIN[4];
INPUT SIN;
INPUT RIN;
INPUT DSRN;
INPUT DCDN;
OUTPUT RDV;
OUTPUT RDWAIT;
OUTPUT DOUT[0];
OUTPUT DOUT[1];
OUTPUT DOUT[2];
OUTPUT DOUT[3];
OUTPUT DOUT[4];
OUTPUT DOUT[5];
OUTPUT DOUT[6];
OUTPUT DOUT[7];
OUTPUT DDIS;
OUTPUT INTQ;
OUTPUT OUT1N;
OUTPUT OUT2N;
OUTPUT BAUDOUTN;
OUTPUT RTSN;
OUTPUT DTRN;
OUTPUT SOUT;

/*Arc definitions start here*/
pos_A[0]__CLK__setup:		SETUP (POSEDGE) A[0] CLK ;
pos_A[1]__CLK__setup:		SETUP (POSEDGE) A[1] CLK ;
pos_A[2]__CLK__setup:		SETUP (POSEDGE) A[2] CLK ;
pos_BAUDCE__CLK__setup:		SETUP (POSEDGE) BAUDCE CLK ;
pos_CS__CLK__setup:		SETUP (POSEDGE) CS CLK ;
pos_CTSN__CLK__setup:		SETUP (POSEDGE) CTSN CLK ;
pos_DCDN__CLK__setup:		SETUP (POSEDGE) DCDN CLK ;
pos_DIN[0]__CLK__setup:		SETUP (POSEDGE) DIN[0] CLK ;
pos_DIN[1]__CLK__setup:		SETUP (POSEDGE) DIN[1] CLK ;
pos_DIN[2]__CLK__setup:		SETUP (POSEDGE) DIN[2] CLK ;
pos_DIN[3]__CLK__setup:		SETUP (POSEDGE) DIN[3] CLK ;
pos_DIN[4]__CLK__setup:		SETUP (POSEDGE) DIN[4] CLK ;
pos_DIN[5]__CLK__setup:		SETUP (POSEDGE) DIN[5] CLK ;
pos_DIN[6]__CLK__setup:		SETUP (POSEDGE) DIN[6] CLK ;
pos_DIN[7]__CLK__setup:		SETUP (POSEDGE) DIN[7] CLK ;
pos_DSRN__CLK__setup:		SETUP (POSEDGE) DSRN CLK ;
pos_RCLK__CLK__setup:		SETUP (POSEDGE) RCLK CLK ;
pos_RD__CLK__setup:		SETUP (POSEDGE) RD CLK ;
pos_RIN__CLK__setup:		SETUP (POSEDGE) RIN CLK ;
pos_RST__CLK__setup:		SETUP (POSEDGE) RST CLK ;
pos_SIN__CLK__setup:		SETUP (POSEDGE) SIN CLK ;
pos_WR__CLK__setup:		SETUP (POSEDGE) WR CLK ;
pos_A[0]__CLK__hold:		HOLD (POSEDGE) A[0] CLK ;
pos_A[1]__CLK__hold:		HOLD (POSEDGE) A[1] CLK ;
pos_A[2]__CLK__hold:		HOLD (POSEDGE) A[2] CLK ;
pos_BAUDCE__CLK__hold:		HOLD (POSEDGE) BAUDCE CLK ;
pos_CS__CLK__hold:		HOLD (POSEDGE) CS CLK ;
pos_CTSN__CLK__hold:		HOLD (POSEDGE) CTSN CLK ;
pos_DCDN__CLK__hold:		HOLD (POSEDGE) DCDN CLK ;
pos_DIN[0]__CLK__hold:		HOLD (POSEDGE) DIN[0] CLK ;
pos_DIN[1]__CLK__hold:		HOLD (POSEDGE) DIN[1] CLK ;
pos_DIN[2]__CLK__hold:		HOLD (POSEDGE) DIN[2] CLK ;
pos_DIN[3]__CLK__hold:		HOLD (POSEDGE) DIN[3] CLK ;
pos_DIN[4]__CLK__hold:		HOLD (POSEDGE) DIN[4] CLK ;
pos_DIN[5]__CLK__hold:		HOLD (POSEDGE) DIN[5] CLK ;
pos_DIN[6]__CLK__hold:		HOLD (POSEDGE) DIN[6] CLK ;
pos_DIN[7]__CLK__hold:		HOLD (POSEDGE) DIN[7] CLK ;
pos_DSRN__CLK__hold:		HOLD (POSEDGE) DSRN CLK ;
pos_RCLK__CLK__hold:		HOLD (POSEDGE) RCLK CLK ;
pos_RD__CLK__hold:		HOLD (POSEDGE) RD CLK ;
pos_RIN__CLK__hold:		HOLD (POSEDGE) RIN CLK ;
pos_RST__CLK__hold:		HOLD (POSEDGE) RST CLK ;
pos_SIN__CLK__hold:		HOLD (POSEDGE) SIN CLK ;
pos_WR__CLK__hold:		HOLD (POSEDGE) WR CLK ;
pos_CLK__BAUDOUTN__delay:		DELAY (POSEDGE) CLK BAUDOUTN ;
pos_CLK__DDIS__delay:		DELAY (POSEDGE) CLK DDIS ;
pos_CLK__DOUT[0]__delay:		DELAY (POSEDGE) CLK DOUT[0] ;
pos_CLK__DOUT[1]__delay:		DELAY (POSEDGE) CLK DOUT[1] ;
pos_CLK__DOUT[2]__delay:		DELAY (POSEDGE) CLK DOUT[2] ;
pos_CLK__DOUT[3]__delay:		DELAY (POSEDGE) CLK DOUT[3] ;
pos_CLK__DOUT[4]__delay:		DELAY (POSEDGE) CLK DOUT[4] ;
pos_CLK__DOUT[5]__delay:		DELAY (POSEDGE) CLK DOUT[5] ;
pos_CLK__DOUT[6]__delay:		DELAY (POSEDGE) CLK DOUT[6] ;
pos_CLK__DOUT[7]__delay:		DELAY (POSEDGE) CLK DOUT[7] ;
pos_CLK__DTRN__delay:		DELAY (POSEDGE) CLK DTRN ;
pos_CLK__INTQ__delay:		DELAY (POSEDGE) CLK INTQ ;
pos_CLK__OUT1N__delay:		DELAY (POSEDGE) CLK OUT1N ;
pos_CLK__OUT2N__delay:		DELAY (POSEDGE) CLK OUT2N ;
pos_CLK__RDV__delay:		DELAY (POSEDGE) CLK RDV ;
pos_CLK__RTSN__delay:		DELAY (POSEDGE) CLK RTSN ;
pos_CLK__SOUT__delay:		DELAY (POSEDGE) CLK SOUT ;
_4.283__delay:		DELAY 4.283  ;
_4.268__delay:		DELAY 4.268  ;

ENDMODEL
