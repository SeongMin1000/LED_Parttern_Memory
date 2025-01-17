module input_module (
    input wire in1,              // 입력 1
    input wire in2,              // 입력 2
    input wire in3,              // 입력 3
    input wire in4,              // 입력 4
    input wire enable,           // 활성화 신호
    output reg [1:0] binary_out  // 2비트 바이너리 출력
);

    always @(*) begin
        if (enable) begin
            case ({in1, in2, in3, in4})
                4'b1000: binary_out = 2'b01; // in1 활성화 -> 01
                4'b0100: binary_out = 2'b10; // in2 활성화 -> 10
                4'b0010: binary_out = 2'b11; // in3 활성화 -> 11
                4'b0001: binary_out = 2'b00; // in4 활성화 -> 00
                default: binary_out = 2'b00; // 잘못된 입력 -> 00
            endcase
        end else begin
            binary_out = 2'b00; // enable이 0일 때 기본값
        end
    end

endmodule
