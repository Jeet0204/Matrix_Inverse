`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:34 10/07/2016 
// Design Name: 
// Module Name:    Matrix_Inverse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module Matrix_Inverse(a11, a12, a13, a14, a15, a21, a22, a23, a24,a25, a31, a32, a33, a34, a35, 
a41, a42, a43, a44, a45, a51, a52, a53, a54, a55, i11, i12, i13, i14, i15, i21, i22,i23, i24,i25, i31, i32, i33, i34, i35, 
i41, i42, i43, i44, i45, i51, i52, i53, i54, i55, pivot1, pivot2, pivot3, pivot4, pivot5 );

input [31:0] a11, a12, a13, a14, a15, a21, a22, a23, a24,a25, a31, a32, a33, a34, a35, 
a41, a42, a43, a44, a45, a51, a52, a53, a54, a55;

output [31:0]i11, i12, i13, i14, i15, i21, i22,i23, i24,i25, i31, i32, i33, i34, i35, 
i41, i42, i43, i44, i45, i51, i52, i53, i54, i55,pivot1, pivot2, pivot3, pivot4, pivot5;


wire [31:0]it21,it22,it23,it24,it25,
it11,it12,it13,it14,it15,
it31,it32,it33,it34,it35,
it41,it42,it43,it44,it45,
it51,it52,it53,it54,it55,
it131,it132,it133,it134,it135,
it141,it142,it143,it144,it145,
it111,it112,it113,it114,it115,
it151,it152,it153,it154,it155,    
it211,it212,it213,it214,it215,    
it221,it222,it223,it224,it225,
it321,it322,it323,it324,it325,
it311,it312,it313,it314,it315,
it331,it332,it333,it334,it335,
it411,it412,it413,it414,it415,
it421,it422,it423,it424,it425,
it431,it432,it433,it434,it435,
it441,it442,it443,it444,it445,
itout21,itout22,itout23,itout24,itout25,
itout11,itout12,itout13,itout14,itout15,
itout31,itout32,itout33,itout34,itout35,
itout41,itout42,itout43,itout44,itout45,
itout51,itout52,itout53,itout54,itout55,
itout131,itout132,itout133,itout134,itout135,
itout141,itout142,itout143,itout144,itout145,
itout111,itout112,itout113,itout114,itout115,
itout151,itout152,itout153,itout154,itout155,    
itout211,itout212,itout213,itout214,itout215,    
itout221,itout222,itout223,itout224,itout225,
itout321,itout322,itout323,itout324,itout325,
itout311,itout312,itout313,itout314,itout315,
itout331,itout332,itout333,itout334,itout335,
itout411,itout412,itout413,itout414,itout415,
itout421,itout422,itout423,itout424,itout425,
itout431,itout432,itout433,itout434,itout435,
itout441,itout442,itout443,itout444,itout445,
aout11,aout12,aout13,aout14,aout15,
aout21,aout22,aout23,aout24,aout25,
aout31,aout32,aout33,aout34,aout35,
aout41,aout42,aout43,aout44,aout45,
aout51,aout52,aout53,aout54,aout55;

assign aout11= 32'b00000000000000000000000000000001;
assign aout12= 32'b00000000000000000000000000000000;
assign aout13= 32'b00000000000000000000000000000000;
assign aout14= 32'b00000000000000000000000000000000;
assign aout15= 32'b00000000000000000000000000000000;
assign aout21= 32'b00000000000000000000000000000000;
assign aout22= 32'b00000000000000000000000000000001;
assign aout23= 32'b00000000000000000000000000000000;
assign aout24= 32'b00000000000000000000000000000000;
assign aout25= 32'b00000000000000000000000000000000;
assign aout31= 32'b00000000000000000000000000000000;
assign aout32= 32'b00000000000000000000000000000000;
assign aout33= 32'b00000000000000000000000000000001;
assign aout34= 32'b00000000000000000000000000000000;
assign aout35= 32'b00000000000000000000000000000000;
assign aout41= 32'b00000000000000000000000000000000;
assign aout42= 32'b00000000000000000000000000000000;
assign aout43= 32'b00000000000000000000000000000000;
assign aout44= 32'b00000000000000000000000000000001;
assign aout45= 32'b00000000000000000000000000000000;
assign aout51= 32'b00000000000000000000000000000000;
assign aout52= 32'b00000000000000000000000000000000;
assign aout53= 32'b00000000000000000000000000000000;
assign aout54= 32'b00000000000000000000000000000000;
assign aout55= 32'b00000000000000000000000000000001;

//	ROW TRANSFORMS A-I
/*jeet*/
//first pivot
assign it21 = (a21 * a11) - (a11 * a21);
assign it22 = (a22 * a11) - (a12 * a21);
assign it23 = (a23 * a11) - (a13 * a21);
assign it24 = (a24 * a11) - (a14 * a21);
assign it25 = (a25 * a11) - (a15 * a21);

assign it31 = (a31 * a11) - (a11 * a31);
assign it32 = (a32 * a11) - (a12 * a31);
assign it33 = (a33 * a11) - (a13 * a31);
assign it34 = (a34 * a11) - (a14 * a31);
assign it35 = (a35 * a11) - (a15 * a31);

assign it41 = (a41 * a11) - (a11 * a41);
assign it42 = (a42 * a11) - (a12 * a41);
assign it43 = (a43 * a11) - (a13 * a41);
assign it44 = (a44 * a11) - (a14 * a41);
assign it45 = (a45 * a11) - (a15 * a41);

assign it51 = (a51 * a11) - (a11 * a51);
assign it52 = (a52 * a11) - (a12 * a51);
assign it53 = (a53 * a11) - (a13 * a51);
assign it54 = (a54 * a11) - (a14 * a51);
assign it55 = (a55 * a11) - (a15 * a51);

//For identity  I-A'
assign itout21 = (aout21 * a11) - (aout11 * a21);
assign itout22 = (aout22 * a11) - (aout12 * a21);
assign itout23 = (aout23 * a11) - (aout13 * a21);
assign itout24 = (aout24 * a11) - (aout14 * a21);
assign itout25 = (aout25 * a11) - (aout15 * a21);

assign itout31 = (aout31 * a11) - (aout11 * a31);
assign itout32 = (aout32 * a11) - (aout12 * a31);
assign itout33 = (aout33 * a11) - (aout13 * a31);
assign itout34 = (aout34 * a11) - (aout14 * a31);
assign itout35 = (aout35 * a11) - (aout15 * a31);

assign itout41 = (aout41 * a11) - (aout11 * a41);
assign itout42 = (aout42 * a11) - (aout12 * a41);
assign itout43 = (aout43 * a11) - (aout13 * a41);
assign itout44 = (aout44 * a11) - (aout14 * a41);
assign itout45 = (aout45 * a11) - (aout15 * a41);

assign itout51 = (aout51 * a11) - (aout11 * a51);
assign itout52 = (aout52 * a11) - (aout12 * a51);
assign itout53 = (aout53 * a11) - (aout13 * a51);
assign itout54 = (aout54 * a11) - (aout14 * a51);
assign itout55 = (aout55 * a11) - (aout15 * a51);


///now second pivot
assign it111 = (a11 * it22) - (it21 *a12);
assign it112 = (a12 * it22) - (it22 * a12);
assign it113 = (a13 * it22) - (it23 * a12);
assign it114 = (a14 * it22) - (it24 * a12);
assign it115 = (a15 * it22) - (it25 * a12);


assign it131 = (it31 * it22) - (it21 *it32);
assign it132 = (it32 * it22) - (it22 * it32);
assign it133 = (it33 * it22) - (it23 * it32);
assign it134 = (it34 * it22) - (it24 * it32);
assign it135 = (it35 * it22) - (it25 * it32);

assign it141 = (it41 * it22) - (it21 *it42);
assign it142 = (it42 * it22) - (it22 * it42);
assign it143 = (it43 * it22) - (it23 * it42);
assign it144 = (it44 * it22) - (it24 * it42);
assign it145 = (it45 * it22) - (it25 * it42);

assign it151 = (it51 * it22) - (it21 *it52);
assign it152 = (it52 * it22) - (it22 * it52);
assign it153 = (it53 * it22) - (it23 * it52);
assign it154 = (it54 * it22) - (it24 * it52);
assign it155 = (it55 * it22) - (it25 * it52);


//for identity
assign itout111 = (aout11 * it22) -  (itout21 *a12);
assign itout112 = (aout12 * it22) - (itout22 * a12);
assign itout113 = (aout13 * it22) - (itout23 * a12);
assign itout114 = (aout14 * it22) - (itout24 * a12);
assign itout115 = (aout15 * it22) - (itout25 * a12);


assign itout131 = (itout31 * it22) - (itout21 *it32);
assign itout132 = (itout32 * it22) - (itout22 * it32);
assign itout133 = (itout33 * it22) - (itout23 * it32);
assign itout134 = (itout34 * it22) - (itout24 * it32);
assign itout135 = (itout35 * it22) - (itout25 * it32);

assign itout141 = (itout41 * it22) - (itout21 *it42);
assign itout142 = (itout42 * it22) - (itout22 * it42);
assign itout143 = (itout43 * it22) - (itout23 * it42);
assign itout144 = (itout44 * it22) - (itout24 * it42);
assign itout145 = (itout45 * it22) - (itout25 * it42);

assign itout151 = (itout51 * it22) - (itout21 *it52);
assign itout152 = (itout52 * it22) - (itout22 * it52);
assign itout153 = (itout53 * it22) - (itout23 * it52);
assign itout154 = (itout54 * it22) - (itout24 * it52);
assign itout155 = (itout55 * it22) - (itout25 * it52);


/*105520*/
//now third pivot
assign it211 = (it111 * it143) - (it141 *it113);
assign it212 = (it112 * it143) - (it142 * it113);
assign it213 = (it113 * it143) - (it143 * it113);
assign it214 = (it114 * it143) - (it144 * it113);
assign it215 = (it115 * it143) - (it145 * it113);


assign it221 = (it21 * it143) - (it141 *it23);
assign it222 = (it22 * it143) - (it142 * it23);
assign it223 = (it23 * it143) - (it143 * it23);
assign it224 = (it24 * it143) - (it144 * it23);
assign it225 = (it25 * it143) - (it145 * it23);


//for identity matrix
assign itout211 = (itout111 * it143) - (itout141 *it113);
assign itout212 = (itout112 * it143) - (itout142 * it113);
assign itout213 = (itout113 * it143) - (itout143 * it113);
assign itout214 = (itout114 * it143) - (itout144 * it113);
assign itout215 = (itout115 * it143) - (itout145 * it113);


assign itout221 = (itout21 * it143) - (itout141 *it23);
assign itout222 = (itout22 * it143) - (itout142 * it23);
assign itout223 = (itout23 * it143) - (itout143 * it23);
assign itout224 = (itout24 * it143) - (itout144 * it23);
assign itout225 = (itout25 * it143) - (itout145 * it23);



//fourth pivot
assign it311 = (it211 * it134) - (it131 *it214);
assign it312 = (it212 * it134) - (it132 * it214);
assign it313 = (it213 * it134) - (it133 * it214);
assign it314 = (it214 * it134) - (it134 * it214);
assign it315 = (it215 * it134) - (it135 * it214);

assign it321 = (it221 * it134) - (it131 *it224);
assign it322 = (it222 * it134) - (it132 * it224);
assign it323 = (it223 * it134) - (it133 * it224);
assign it324 = (it224 * it134) - (it134 * it224);
assign it325 = (it225 * it134) - (it135 * it224);

assign it331 = (it141 * it134) - (it131 *it144);
assign it332 = (it142 * it134) - (it132 * it144);
assign it333 = (it143 * it134) - (it133 * it144);
assign it334 = (it144 * it134) - (it134 * it144);
assign it335 = (it145 * it134) - (it135 * it144);

//for identity matrix
assign itout311 = (itout211 * it134) - (itout131 *it214);
assign itout312 = (itout212 * it134) - (itout132 * it214);
assign itout313 = (itout213 * it134) - (itout133 * it214);
assign itout314 = (itout214 * it134) - (itout134 * it214);
assign itout315 = (itout215 * it134) - (itout135 * it214);

assign itout321 = (itout221 * it134) - (itout131 *it224);
assign itout322 = (itout222 * it134) - (itout132 * it224);
assign itout323 = (itout223 * it134) - (itout133 * it224);
assign itout324 = (itout224 * it134) - (itout134 * it224);
assign itout325 = (itout225 * it134) - (itout135 * it224);

assign itout331 = (itout141 * it134) - (itout131 *it144);
assign itout332 = (itout142 * it134) - (itout132 * it144);
assign itout333 = (itout143 * it134) - (itout133 * it144);
assign itout334 = (itout144 * it134) - (itout134 * it144);
assign itout335 = (itout145 * it134) - (itout135 * it144);





//fifth pivot
assign it411 = (it311 * it155) - (it151 * it315);
assign it412 = (it312 * it155) - (it152 * it315);
assign it413 = (it313 * it155) - (it153 * it315);
assign it414 = (it314 * it155) - (it154 * it315);
assign it415 = (it315 * it155) - (it155 * it315);

assign it421 = (it321 * it155) - (it151 * it325);
assign it422 = (it322 * it155) - (it152 * it325);
assign it423 = (it323 * it155) - (it153 * it325);
assign it424 = (it324 * it155) - (it154 * it325);
assign it425 = (it325 * it155) - (it155 * it325);

assign it431 = (it331 * it155) - (it151 * it335);
assign it432 = (it332 * it155) - (it152 * it335);
assign it433 = (it333 * it155) - (it153 * it335);
assign it434 = (it334 * it155) - (it154 * it335);
assign it435 = (it335 * it155) - (it155 * it335);

assign it441 = (it131 * it155) - (it151 * it135);
assign it442 = (it132 * it155) - (it152 * it135);
assign it443 = (it133 * it155) - (it153 * it135);
assign it444 = (it134 * it155) - (it154 * it135);
assign it445 = (it135 * it155) - (it155 * it135);


//for id
assign itout411 = (itout311 * it155) - (itout151 * it315);
assign itout412 = (itout312 * it155) - (itout152 * it315);
assign itout413 = (itout313 * it155) - (itout153 * it315);
assign itout414 = (itout314 * it155) - (itout154 * it315);
assign itout415 = (itout315 * it155) - (itout155 * it315);

assign itout421 = (itout321 * it155) - (itout151 * it325);
assign itout422 = (itout322 * it155) - (itout152 * it325);
assign itout423 = (itout323 * it155) - (itout153 * it325);
assign itout424 = (itout324 * it155) - (itout154 * it325);
assign itout425 = (itout325 * it155) - (itout155 * it325);

assign itout431 = (itout331 * it155) - (itout151 * it335);
assign itout432 = (itout332 * it155) - (itout152 * it335);
assign itout433 = (itout333 * it155) - (itout153 * it335);
assign itout434 = (itout334 * it155) - (itout154 * it335);
assign itout435 = (itout335 * it155) - (itout155 * it335);

assign itout441 = (itout131 * it155) - (itout151 * it135);
assign itout442 = (itout132 * it155) - (itout152 * it135);
assign itout443 = (itout133 * it155) - (itout153 * it135);
assign itout444 = (itout134 * it155) - (itout154 * it135);
assign itout445 = (itout135 * it155) - (itout155 * it135);

assign i11 = itout411 ;
assign i12 = itout412 ;
assign i13 = itout413 ;
assign i14 = itout414 ;
assign i15 = itout415 ;

assign i21 = itout421 ;
assign i22 = itout422;
assign i23 = itout423 ;
assign i24 = itout424 ;
assign i25 = itout425 ;


assign i31 = itout431 ;
assign i32 = itout432 ;
assign i33 = itout433 ;
assign i34 = itout434 ;
assign i35 = itout435 ;

assign i41 = itout441 ;
assign i42 = itout442 ;
assign i43 = itout443 ;
assign i44 = itout444 ;
assign i45 = itout445 ;


assign i51 = itout151 ;
assign i52 = itout152 ;
assign i53 = itout153 ;
assign i54 = itout154 ;
assign i55 = itout155 ;

assign pivot1 = it411;
assign pivot2 = it422;
assign pivot3 = it433;
assign pivot4 = it444;
assign pivot5 = it155;

endmodule
