// input 8 nums
module  inputNum(
	sw_left, /*sw_right, */sw_add, /*sw_sub, */enable, nums, clk, clr, curPage
);
	input sw_left;
	// input sw_right;
	// input sw_sub;
	input sw_add;
	input enable;
    input clk;
    input clr;
	output[35:0] nums;
    output reg curPage;
    reg [3:0] status;
	reg [7:0] cur;
    wire sw_add_led;
    wire sw_left_led;	

	initial begin
		cur = 'b00000001;
        curPage = 'b0; 
        status = 'd0;
	end

    always @(posedge clk) begin
        if(clr=='b1)
            status = 'd10;      // s
        else
            case (cur)
                'b00000000: status = 'd11;  // u
                'b00000001: status = 'd1;
                'b00000010: status = 'd2;
                'b00000100: status = 'd3;
                'b00001000: status = 'd4;
                'b00010000: status = 'd5;
                'b00100000: status = 'd6;
                'b01000000: status = 'd7;
                'b10000000: status = 'd8;
                default : status = 'd12;    // d
            endcase

        if(cur >= 'b00010000)
            curPage = 'b0;
        else
            curPage = 'b1;

    end

	always @(posedge sw_left) begin 

        begin
            if(cur == 'b10000000)
            	cur = 'b00000001;
            else
            	cur <= cur << 1'b1;
        end
    end

    // always @(negedge sw_right) begin
    //     if(cur == 'b00000001)
    //     	cur = 'b10000000;
    //     else
    //     	cur <= cur >> 1'b1;
    // end 

    // always @(*) begin
    // 	if(~enable)
    // 		cur = 'b00000000;
    // end

    counter c0(sw_add, /*sw_sub,*/ nums[3:0], cur[0], clk);
    counter c1(sw_add, /*sw_sub,*/ nums[7:4], cur[1], clk);
    counter c2(sw_add, /*sw_sub,*/ nums[11:8], cur[2], clk);
    counter c3(sw_add, /*sw_sub,*/ nums[15:12], cur[3], clk);
    counter c4(sw_add, /*sw_sub,*/ nums[19:16], cur[4], clk);
    counter c5(sw_add, /*sw_sub,*/ nums[23:20], cur[5], clk);
    counter c6(sw_add, /*sw_sub,*/ nums[27:24], cur[6], clk);
    counter c7(sw_add, /*sw_sub,*/ nums[31:28], cur[7], clk);

    assign nums[35:32] = status;

endmodule 