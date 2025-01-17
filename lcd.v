module lcd (
    input wire CLK,                 // 시스템 클럭 (1 MHz)
    input wire RESETN,              // 리셋 신호, active low
    input wire ENABLE,              // 시작 신호
    input wire is_equal,            // 성공 여부 신호 (1: SUCCESS, 0: FAIL)
    output reg TLCD_RS,             // LCD RS 핀
    output reg TLCD_RW,             // LCD RW 핀
    output reg TLCD_E,              // LCD E 핀
    output reg [7:0] TLCD_DATA,     // LCD 데이터 핀
    output reg DONE                 // 작업 완료 신호
);

    // 파라미터 설정
    parameter E_PULSE_WIDTH = 1;       // E 신호 펄스 폭 (1 μs)
    parameter EXEC_TIME     = 40;      // 명령 실행 시간 (40 μs)
    parameter CLEAR_EXEC    = 1640;    // 화면 클리어 실행 시간 (1.64 ms)
    parameter DISPLAY_TIME  = 2000000; // 문자열 출력 시간 (2초, 1MHz 기준)

    // 상태 정의
    reg [4:0] state;
    parameter IDLE              = 5'd0,
              FUNCTION_SET      = 5'd1,
              FUNCTION_SET_WAIT = 5'd2,
              DISP_ONOFF        = 5'd3,
              DISP_ONOFF_WAIT   = 5'd4,
              ENTRY_MODE        = 5'd5,
              ENTRY_MODE_WAIT   = 5'd6,
              CLEAR_DISP        = 5'd7,
              CLEAR_DISP_WAIT   = 5'd8,
              LINE1_ADDR        = 5'd9,
              LINE1_ADDR_WAIT   = 5'd10,
              LINE1_WRITE       = 5'd11,
              LINE1_WRITE_WAIT  = 5'd12,
              LINE2_ADDR        = 5'd13,
              LINE2_ADDR_WAIT   = 5'd14,
              LINE2_WRITE       = 5'd15,
              LINE2_WRITE_WAIT  = 5'd16,
              DISPLAY_HOLD      = 5'd17,
              CLEAR_TEXT        = 5'd18,
              DONE_STATE        = 5'd19,
              INITIALIZE        = 5'd20; // 초기화 상태 추가

    // 내부 변수
    reg [15:0] cnt;               // 타이머 카운터
    reg [4:0] char_index;         // 현재 문자 인덱스
    reg [31:0] display_cnt;       // 문자열 출력 유지 시간 카운터
    reg prev_ENABLE;              // 이전 ENABLE 상태 저장

    // SUCCESS/FAIL 문자열 정의
    reg [8*16-1:0] TEXT_STRING_UPPER; // Line 1 문자열
    reg [8*16-1:0] TEXT_STRING_LOWER; // Line 2 문자열

    always @(posedge CLK or negedge RESETN) begin
        if (!RESETN) begin
            // 초기화
            state <= INITIALIZE; // 리셋 시 초기화 상태로 진입
        end else begin
            case (state)
                // 초기화 상태
                INITIALIZE: begin
                    cnt <= 0;
                    char_index <= 0;
                    display_cnt <= 0;
                    prev_ENABLE <= 0;
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_E  <= 0;
                    TLCD_DATA <= 8'b0;
                    DONE <= 0;
                    TEXT_STRING_UPPER <= "                "; // 빈 문자열 초기화
                    TEXT_STRING_LOWER <= "                "; // 빈 문자열 초기화
                    state <= IDLE; // 초기화 후 대기 상태로 진입
                end

                // 대기 상태
                IDLE: begin
                    DONE <= 0;
                    TLCD_E <= 0;
                    if (ENABLE && !prev_ENABLE) begin
                        // is_equal 값에 따라 문자열 설정
                        if (is_equal) begin
                            TEXT_STRING_UPPER <= "    SUCCESS    ";
                            TEXT_STRING_LOWER <= "   GOOD JOB    ";
                        end else begin
                            TEXT_STRING_UPPER <= "     FAIL      ";
                            TEXT_STRING_LOWER <= " TRY AGAIN     ";
                        end
                        state <= FUNCTION_SET;
                    end
                    prev_ENABLE <= ENABLE;
                end

                // LCD 초기화: Function Set
                FUNCTION_SET: begin
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_DATA <= 8'b00111000; // Function Set
                    TLCD_E <= 1;
                    cnt <= 0;
                    state <= FUNCTION_SET_WAIT;
                end

                FUNCTION_SET_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        state <= DISP_ONOFF;
                    end
                end

                // LCD 초기화: Display On/Off Control
                DISP_ONOFF: begin
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_DATA <= 8'b00001100; // Display ON, Cursor OFF
                    TLCD_E <= 1;
                    cnt <= 0;
                    state <= DISP_ONOFF_WAIT;
                end

                DISP_ONOFF_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        state <= ENTRY_MODE;
                    end
                end

                // LCD 초기화: Entry Mode Set
                ENTRY_MODE: begin
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_DATA <= 8'b00000110; // Entry Mode Set
                    TLCD_E <= 1;
                    cnt <= 0;
                    state <= ENTRY_MODE_WAIT;
                end

                ENTRY_MODE_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        state <= LINE1_ADDR;
                    end
                end

                // Line 1 시작 주소 설정
                LINE1_ADDR: begin
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_DATA <= 8'b10000000; // Line 1 starting address
                    TLCD_E <= 1;
                    cnt <= 0;
                    state <= LINE1_ADDR_WAIT;
                end

                LINE1_ADDR_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        char_index <= 0;
                        state <= LINE1_WRITE;
                    end
                end

                // Line 1에 문자열 쓰기
                LINE1_WRITE: begin
                    if (char_index < 16) begin
                        TLCD_RS <= 1;
                        TLCD_RW <= 0;
                        TLCD_DATA <= TEXT_STRING_UPPER[(15-char_index)*8 +: 8];
                        TLCD_E <= 1;
                        cnt <= 0;
                        state <= LINE1_WRITE_WAIT;
                    end else begin
                        state <= LINE2_ADDR;
                    end
                end

                LINE1_WRITE_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        char_index <= char_index + 1;
                        state <= LINE1_WRITE;
                    end
                end

                // Line 2 시작 주소 설정
                LINE2_ADDR: begin
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_DATA <= 8'b11000000; // Line 2 starting address
                    TLCD_E <= 1;
                    cnt <= 0;
                    state <= LINE2_ADDR_WAIT;
                end

                LINE2_ADDR_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        char_index <= 0;
                        state <= LINE2_WRITE;
                    end
                end

                // Line 2에 문자열 쓰기
                LINE2_WRITE: begin
                    if (char_index < 16) begin
                        TLCD_RS <= 1;
                        TLCD_RW <= 0;
                        TLCD_DATA <= TEXT_STRING_LOWER[(15-char_index)*8 +: 8];
                        TLCD_E <= 1;
                        cnt <= 0;
                        state <= LINE2_WRITE_WAIT;
                    end else begin
                        state <= DISPLAY_HOLD;
                    end
                end

                LINE2_WRITE_WAIT: begin
                    cnt <= cnt + 1;
                    if (cnt >= E_PULSE_WIDTH) TLCD_E <= 0;
                    if (cnt >= EXEC_TIME) begin
                        cnt <= 0;
                        char_index <= char_index + 1;
                        state <= LINE2_WRITE;
                    end
                end

                // 2초 동안 문자열 유지
                DISPLAY_HOLD: begin
                    display_cnt <= display_cnt + 1;
                    if (display_cnt >= DISPLAY_TIME) begin
                        display_cnt <= 0;
                        state <= CLEAR_TEXT;
                    end
                end

                // 화면 클리어
                CLEAR_TEXT: begin
                    TLCD_RS <= 0;
                    TLCD_RW <= 0;
                    TLCD_DATA <= 8'b00000001; // Clear Display
                    TLCD_E <= 1;
                    cnt <= 0;
                    state <= DONE_STATE;
                end

                // 완료 상태
                DONE_STATE: begin
                    if (is_equal) begin
                        DONE <= 1;  // is_equal이 1일 때 DONE 신호를 1로 설정
                    end else begin
                        DONE <= 0;  // is_equal이 0일 때 DONE 신호를 0으로 설정
                    end
                    state <= INITIALIZE; // 완료 후 초기화 상태로 진입
                end

                default: state <= INITIALIZE; // 기본적으로 초기화 상태로 진입
            endcase
        end
    end
endmodule