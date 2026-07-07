// Simple Tang Nano 9K example project
// Board: Sipeed Tang Nano 9K
// FPGA:  Gowin GW1NR-LV9QN88PC6/I5
// Clock: 27 MHz onboard clock
//
// Purpose:
// - Provide a clean starting point for Codex CLI modifications
// - Blink six LEDs
// - Use buttons as simple speed controls
// - Keep UART pins defined but idle for later extension

module top (
    input  wire       clk,
    input  wire       btn1,
    input  wire       btn2,
    output wire [5:0] led,
    output wire       uart_tx,
    input  wire       uart_rx
);

    // Tang Nano 9K onboard clock is usually 27 MHz.
    localparam integer CLK_HZ = 27_000_000;

    // Buttons use pull-ups in the constraint file, so pressed means logic 0.
    wire btn1_pressed = ~btn1;
    wire btn2_pressed = ~btn2;

    // Counter width is intentionally generous for slow LED blinking.
    reg [31:0] counter = 32'd0;

    always @(posedge clk) begin
        counter <= counter + 1'b1;
    end

    // Select different counter bits to change blink speed.
    // btn1 pressed: faster
    // btn2 pressed: slower
    wire [5:0] led_pattern_normal = counter[26:21];
    wire [5:0] led_pattern_fast   = counter[24:19];
    wire [5:0] led_pattern_slow   = counter[28:23];

    reg [5:0] led_pattern;

    always @(*) begin
        if (btn1_pressed) begin
            led_pattern = led_pattern_fast;
        end else if (btn2_pressed) begin
            led_pattern = led_pattern_slow;
        end else begin
            led_pattern = led_pattern_normal;
        end
    end

    // Many Tang Nano examples use active-low LEDs.
    // If your LEDs behave inverted, remove the '~'.
    assign led = ~led_pattern;

    // Keep UART TX idle high. UART RX is currently unused.
    assign uart_tx = 1'b1;

    // Prevent unused-input warnings from becoming confusing later.
    wire _unused = uart_rx;

endmodule
