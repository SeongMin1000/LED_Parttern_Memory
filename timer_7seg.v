module timer_7seg(
    input wire clk,             // 시스템 클록 입력 (예: 1MHz)
    input wire reset_n,         // Active Low 리셋 신호
    input wire start_countdown, // 카운트다운 시작 신호
    output reg next_stage,      // 다음 단계로 전환 신호
    output reg [1:0] seconds    // 현재 남은 시간 (2비트, 0~3)
);

    reg [1:0] state;        // 상태 레지스터
    reg [19:0] counter;     // 분주용 카운터 (1MHz에 맞게 크기 설정)
    parameter CLOCK_DIVIDE = 1000000; // 1초에 해당하는 분주값 (1MHz 기준)

    parameter IDLE = 2'b00,      // 대기 상태
              COUNTDOWN = 2'b01, // 3초 카운트다운 상태
              NEXT = 2'b10;      // 다음 단계 전환 상태

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            counter <= 0;
            seconds <= 3;      // 초기값 3초
            next_stage <= 0;
        end
        else begin
            case (state)
                IDLE: begin
                    next_stage <= 0;
                    counter <= 0;
                    seconds <= 3; // 초기화 시 3초로 설정
                    if (start_countdown) begin
                        state <= COUNTDOWN;
                    end
                end

                COUNTDOWN: begin
                    if (counter >= CLOCK_DIVIDE - 1) begin
                        counter <= 0;
                        if (seconds > 0) begin
                            seconds <= seconds - 1; // 초 감소
                        end
                        else begin
                            state <= NEXT; // 3초가 끝나면 다음 상태로 전환
                        end
                    end
                    else begin
                        counter <= counter + 1;
                    end
                end

                NEXT: begin
                    next_stage <= 1; // 다음 단계 신호 활성화
                end
            endcase
        end
    end
endmodule