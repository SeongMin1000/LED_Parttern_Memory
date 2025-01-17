module mux81_2bit (
    input [1:0] in0, in1, in2, in3, in4, in5, in6, in7,  // 8개의 2비트 입력
    input [2:0] sel, // 3비트 선택 신호
    output reg [1:0] out // 2비트 출력
);

    always @(*) begin
        case (sel)
            3'b000: out = in7;
            3'b001: out = in0;
            3'b010: out = in1;
            3'b011: out = in2;
            3'b100: out = in3;
            3'b101: out = in4;
            3'b110: out = in5;
            3'b111: out = in6;
            default: out = 2'b00; // 기본값
        endcase
    end
endmodule
