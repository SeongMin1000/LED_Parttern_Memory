module counter_4bit(
    input wire clk,          // 클럭 입력
    input wire reset_n,      // Active Low 리셋 신호
    input wire enable,       // 카운터 활성화 신호
    output reg [3:0] count,  // 4비트 카운터 값
    output reg done          // 카운트 완료 신호
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 0;      // 리셋 시 카운터 초기화
            done <= 0;       // 완료 신호 비활성화
        end
        else if (enable) begin
            if (count == 4'b1001 && !done) begin // 9(십진수)를 세었을 때, done이 0일 때
                count <= 0;            // 다시 0부터 시작
                done <= 1;             // 완료 신호 활성화
            end
            else if (count != 4'b1001) begin
                count <= count + 1;    // 카운터 증가
            end
        end
    end
endmodule
