module shift_register_16to8 (
    input wire clk,                    // 클럭 신호
    input wire rst,                    // 리셋 신호
    input wire [15:0] data_in,         // 16비트 입력 데이터
    input wire load,                   // 입력 로드 신호
    output reg [1:0] reg_out0,         // 2비트 레지스터 0
    output reg [1:0] reg_out1,         // 2비트 레지스터 1
    output reg [1:0] reg_out2,         // 2비트 레지스터 2
    output reg [1:0] reg_out3,         // 2비트 레지스터 3
    output reg [1:0] reg_out4,         // 2비트 레지스터 4
    output reg [1:0] reg_out5,         // 2비트 레지스터 5
    output reg [1:0] reg_out6,         // 2비트 레지스터 6
    output reg [1:0] reg_out7,         // 2비트 레지스터 7
    output reg done                    // 입력 완료 신호
);

    reg [2:0] write_count;             // 몇 번째 레지스터에 쓰는지 카운트

    initial begin
        write_count = 3'b000;
        done = 1'b0;
        reg_out0 = 2'b00;
        reg_out1 = 2'b00;
        reg_out2 = 2'b00;
        reg_out3 = 2'b00;
        reg_out4 = 2'b00;
        reg_out5 = 2'b00;
        reg_out6 = 2'b00;
        reg_out7 = 2'b00;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // 초기화
            write_count <= 3'b000;
            done <= 1'b0;
            reg_out0 <= 2'b00;
            reg_out1 <= 2'b00;
            reg_out2 <= 2'b00;
            reg_out3 <= 2'b00;
            reg_out4 <= 2'b00;
            reg_out5 <= 2'b00;
            reg_out6 <= 2'b00;
            reg_out7 <= 2'b00;
        end else if (load && !done) begin
            // 데이터 로드
            case (write_count)
                3'b000: reg_out0 <= data_in[15:14];
                3'b001: reg_out1 <= data_in[13:12];
                3'b010: reg_out2 <= data_in[11:10];
                3'b011: reg_out3 <= data_in[9:8];
                3'b100: reg_out4 <= data_in[7:6];
                3'b101: reg_out5 <= data_in[5:4];
                3'b110: reg_out6 <= data_in[3:2];
                3'b111: reg_out7 <= data_in[1:0];
            endcase
            if (write_count == 3'b111) begin
                done <= 1'b1; // 모든 레지스터에 값이 채워지면 완료 신호
            end else begin
                write_count <= write_count + 1;
            end
        end
    end

endmodule
