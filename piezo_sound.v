module piezo_sound(
    input clk_1mhz,  // 1 MHz 클럭
    input enable,    // enable 신호
    input equal,     // equal 값에 따른 출력 구분
    output reg piezo = 0  // 피에조 소리 출력
);

    // 음계 주파수 (2초 동안 출력하기 위한 주파수 설정)
    parameter DO1 = 1910;  // DO1 (261.63 Hz)
    parameter LE = 1706;   // LE (293.66 Hz)

    reg [18:0] time_count = 0;  // 시간 카운터 (2초 동안 소리 내기)
    reg [10:0] piezo_count = 0; // 피에조 카운터

    // 소리 출력 주파수를 설정
    reg [10:0] frequency; // 주파수 (DO1 또는 LE)

    // 2초 동안 소리를 내기 위한 카운트
    parameter TONE_DURATION = 2_000_000; // 2초

    always @(posedge clk_1mhz) begin
        if (enable) begin
            // enable 신호가 들어오면 2초 동안 소리를 출력
            if (time_count < TONE_DURATION) begin
                time_count <= time_count + 1;

                // equal 값에 따라 주파수 설정
                if (equal) begin
                    frequency <= DO1;  // equal == 1이면 DO1
                end else begin
                    frequency <= LE;   // equal == 0이면 LE
                end

                // 주파수에 맞게 피에조 신호 반전
                if (piezo_count < frequency) begin
                    piezo_count <= piezo_count + 1;
                end else begin
                    piezo_count <= 0;
                    piezo <= ~piezo; // 피에조 반전
                end
            end else begin
                // 2초가 지나면 소리 멈춤
                piezo <= 0;  // 소리 멈춤
                time_count <= 0; // 카운터 리셋
            end
        end else begin
            // enable 신호가 없으면 소리 멈춤
            piezo <= 0;
            time_count <= 0;
        end
    end
endmodule