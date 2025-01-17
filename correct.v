module correct (
    input wire clk,               // 클럭 신호
    input wire enable,            // enable 신호
    input wire [15:0] amp,        // 첫 번째 16비트 입력
    input wire [15:0] bmp,        // 두 번째 16비트 입력
    output reg is_equal           // 두 입력이 같은지 여부 (레지스터 출력)
);

    reg [15:0] amp_reg;           // 이전 amp 값 저장
    reg [15:0] bmp_reg;           // 이전 bmp 값 저장
    wire [15:0] bit_compare;      // 각 비트를 비교한 결과 저장
    reg locked;                   // 값을 고정하기 위한 플래그

    // 각 비트를 개별적으로 비교
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : bit_comparison
            assign bit_compare[i] = (amp_reg[i] == bmp_reg[i]) ? 1'b1 : 1'b0;
        end
    endgenerate

    // 클럭 신호와 enable 신호에 따라 is_equal 업데이트
    always @(posedge clk) begin
        if (enable && !locked) begin
            amp_reg <= amp;       // amp 값 업데이트
            bmp_reg <= bmp;       // bmp 값 업데이트
            is_equal <= &bit_compare; // AND 연산으로 모든 비트가 1인지 확인
            locked <= 1'b1;       // 값 고정
        end else if (!enable) begin
            locked <= 1'b0;       // enable이 0일 때 고정 해제
        end
    end

endmodule