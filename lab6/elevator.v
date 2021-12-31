module elevator (
    input clk,
    input rst,
    input [3:0] des,
    output reg [3:0] cur_floor, // 1, 2, 3, 4
    output reg is_open,         // 0 close, 1 open
    output reg [1:0] move,      // 0 stop, 1 up, 2 down
    output reg [3:0] clr
);
    reg [3:0] stop_adder;
    reg [3:0] des_floor;
    reg [2:0] dir_temp;
    initial begin
        // set to floor 1, closed, stopped
        cur_floor = 'd1;
        is_open = 0;
        dir_temp = 0;
        stop_adder = 0;
        des_floor = des;
        clr = 0;
    end
    always @(posedge clk ) begin
        if(stop_adder != 0) begin
            case (cur_floor)
                1: clr[0] = 1;
                2: clr[1] = 1;
                3: clr[2] = 1;
                4: clr[3] = 1; 
            endcase 
            move = 0;
            is_open = 1;
            stop_adder = stop_adder + 1;
            if(stop_adder == 'd10) begin
                stop_adder = 0;
                is_open = 0;
                clr = 0;
            end
        end
        else begin
            des_floor = des;
            case (cur_floor)
                'd1: begin
                    des_floor[0] = 'b0;
                    if(des_floor[3:1]!='b000) begin
                        move = 1;
                        dir_temp = move;
                        cur_floor = cur_floor + 1;
                    end
                    else begin
                        move = 0;
                        dir_temp = move;
                        stop_adder = 1;
                    end
                end 
                'd2: begin
                    des_floor[1] = 'b0;
                    case (dir_temp)
                        1:begin
                            if (des_floor[3:2]!='b00) begin
                                move = dir_temp;
                                cur_floor = cur_floor + 1; 
                            end
                            else begin
                                if (des_floor[0]!=0) begin
                                    move = 2;
                                    dir_temp = move;
                                    cur_floor = cur_floor - 1; 
                                end
                                else begin
                                    move = 0;
                                    dir_temp = move;
                                    stop_adder = 1;
                                end
                            end
                        end 
                        2:begin
                            if (des_floor[0]!=0) begin
                                move = dir_temp;
                                cur_floor = cur_floor - 1;
                            end
                            else begin
                                if (des_floor[3:2]!='b00) begin
                                    move = 1;
                                    dir_temp = move;
                                    cur_floor = cur_floor + 1;
                                end
                                else begin
                                    move = 0;
                                    dir_temp = move;
                                    stop_adder = 1;
                                end
                            end
                        end 
                    endcase
                end
                'd3: begin
                    des_floor[2] = 'b0;
                    case (dir_temp)
                        1:begin
                            if (des_floor[3]!='b0) begin
                                move = 1;
                                dir_temp = move;
                                cur_floor = cur_floor + 1; 
                            end
                            else begin
                                if (des_floor[1:0]!='b00) begin
                                    move = 2;
                                    dir_temp = move;
                                    cur_floor = cur_floor - 1; 
                                end
                                else begin
                                    move = 0;
                                    dir_temp = move;
                                    stop_adder = 1;
                                end
                            end
                        end 
                        2:begin
                            if (des_floor[1:0]!='b00) begin
                                move = dir_temp;
                                cur_floor = cur_floor - 1;
                            end
                            else begin
                                if (des_floor[3]!='b0) begin
                                    move = 1;
                                    dir_temp = move;
                                    cur_floor = cur_floor + 1;
                                end
                                else begin
                                    move = 0;
                                    dir_temp = move;
                                    stop_adder = 1;
                                end
                            end
                        end 
                    endcase
                end
                'd4: begin
                    des_floor[3] = 'b0;
                    if(des_floor[2:0]!='b000) begin
                        move = 2;
                        dir_temp = move;
                        cur_floor = cur_floor - 1;
                    end
                    else begin
                        move = 0;
                        dir_temp = move;
                        stop_adder = 1;
                    end
                end
            endcase
        end
    end
endmodule