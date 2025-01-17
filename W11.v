module W11 (
    input wire CLK,
    input wire RESETN,
    output wire TLCD_E,
    output wire TLCD_RS,
    output wire TLCD_RW,
    output wire [7:0] TLCD_DATA
);

    wire font_loader_done;
    reg enable_lcd;
    wire TLCD_E_font, TLCD_RS_font, TLCD_RW_font;
    wire [7:0] TLCD_DATA_font;

    wire TLCD_E_text, TLCD_RS_text, TLCD_RW_text;
    wire [7:0] TLCD_DATA_text;

    // Upper line text: "FAIL            " (16 characters)
    parameter [816-1:0] TEXT_STRING_UPPER = {"FAIL            "};

    // Lower line text: Leave empty
    parameter [816-1:0] TEXT_STRING_LOWER = {"                "};

    // Text LCD controller instance
    tlcd_controller lcd_inst (
        .RESETN(RESETN),
        .CLK(CLK),
        .ENABLE(enable_lcd),
        .TLCD_E(TLCD_E_text),
        .TLCD_RS(TLCD_RS_text),
        .TLCD_RW(TLCD_RW_text),
        .TLCD_DATA(TLCD_DATA_text),
        .TEXT_STRING_UPPER(TEXT_STRING_UPPER),
        .TEXT_STRING_LOWER(TEXT_STRING_LOWER)
    );

    // Custom font loader instance
 

    // Control the ENABLE signal based on font loading completion
    always @(posedge CLK or posedge RESETN) begin
        if (RESETN) begin
            enable_lcd <= 0;
        end else if (font_loader_done) begin
            enable_lcd <= 1;
        end
    end

    // LCD control signal selection
    assign TLCD_E    = font_loader_done ? TLCD_E_text    : TLCD_E_font;
    assign TLCD_RS   = font_loader_done ? TLCD_RS_text   : TLCD_RS_font;
    assign TLCD_RW   = font_loader_done ? TLCD_RW_text   : TLCD_RW_font;
    assign TLCD_DATA = font_loader_done ? TLCD_DATA_text : TLCD_DATA_font;

endmodule
