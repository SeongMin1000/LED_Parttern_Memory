module fail (
    input wire reset_not,      // 리셋 비활성 신호 (active low)
    input wire enable,         // Enable 신호
    input wire state,          // 상태 신호
    output reg [7:0] lcd_data, // LCD 데이터 출력 (ASCII 문자)
    output reg lcd_enable      // LCD Enable 신호
);

    // "Fail" 메시지 정의 (ASCII 값)
    reg [7:0] fail_message [0:3];
    reg [1:0] char_index;

    initial begin
        fail_message[0] = 8'h46; // 'F'
        fail_message[1] = 8'h61; // 'a'
        fail_message[2] = 8'h69; // 'i'
        fail_message[3] = 8'h6C; // 'l'
    end

    always @(*) begin
        if (!reset_not) begin
            // 리셋 상태: 초기화
            lcd_data = 8'b0;
            lcd_enable = 0;
            char_index = 0;
        end else if (enable && state) begin
            // 조건 충족 시 "Fail" 메시지 출력
            lcd_data = fail_message[char_index];
            lcd_enable = 1; // LCD 활성화
            char_index = char_index + 1;
            if (char_index == 4) begin
                char_index = 0; // 모든 문자를 출력하면 초기화
            end
        end else begin
            // 기본 상태
            lcd_data = 8'b0;
            lcd_enable = 0;
        end
    end

endmodule
