module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output reg walk_left,
    output reg walk_right);
    initial begin
        walk_left = 1;
        walk_right = 0;
    end
    always @(posedge clk) begin
        if(areset)begin
            walk_left=1;
            walk_right=0;
        end
        else  begin
            if(walk_left)begin
                if(bump_left)begin
                    walk_left = 0;
                    walk_right = 1;
                end
            end
            else begin
                if(bump_right)begin
                    walk_left = 1;
                    walk_right = 0;
                end
            end
        end
    end
endmodule
