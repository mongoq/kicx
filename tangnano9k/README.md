# Tang Nano 9K Blink Example

This is a minimal Tang Nano 9K FPGA project intended as a clean starting point for Codex CLI.

## Files

- `top.v` - Verilog top module with blinking LEDs and simple button speed control
- `constraints.cst` - Pin constraints for the Tang Nano 9K
- `Makefile` - OSS CAD Suite build flow

## Build

```bash
make
```

## Program SRAM

```bash
make prog
```

## Program Flash

```bash
make flash
```

## Clean

```bash
make clean
```

## Notes

The LEDs are assumed to be active-low. If the LEDs behave inverted, change this line in `top.v`:

```verilog
assign led = ~led_pattern;
```

to:

```verilog
assign led = led_pattern;
```
