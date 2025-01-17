module lfsr_16bit(
    input wire clk,             // 클럭 신호
    input wire next_stage,      // 단계 전환 신호
    output reg [15:0] rand_out, // 16비트 난수 출력
    output reg has_generated    // 난수가 생성되었는지 여부 출력
);
    wire feedback;              // LFSR 피드백 신호

    // LFSR의 피드백 신호 계산
    assign feedback = rand_out[15] ^ rand_out[13] ^ rand_out[12] ^ rand_out[10];

    initial begin
        rand_out = 16'hACE1;    // 초기 값
        has_generated = 0;      // 난수가 아직 생성되지 않음
    end

    // LFSR 동작: 클럭 기반으로 난수 생성
    always @(posedge clk) begin
        if (next_stage && !has_generated) begin
            rand_out <= {rand_out[14:0], feedback}; // LFSR 비트 순환 및 피드백 적용
            has_generated <= 1; // 난수가 생성되었음을 표시
        end else if (!next_stage) begin
            // next_stage가 0일 때는 계속 난수 생성
            rand_out <= {rand_out[14:0], feedback}; // LFSR 비트 순환 및 피드백 적용
        end
    end
endmodule
