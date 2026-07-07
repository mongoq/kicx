# Makefile for Tang Nano 9K using OSS CAD Suite
#
# Expected tools in PATH:
#   yosys
#   nextpnr-himbaechel
#   gowin_pack
#   openFPGALoader
#
# Useful commands:
#   make          Build bitstream
#   make prog     Program SRAM
#   make flash    Program external flash
#   make clean    Remove generated files

TOP      := top
DEVICE   := GW1NR-LV9QN88PC6/I5
FAMILY   := GW1N-9C
BOARD    := tangnano9k
CST      := constraints.cst
SOURCES  := top.v

BUILD_DIR := build
JSON      := $(BUILD_DIR)/$(TOP).json
PNR_JSON  := $(BUILD_DIR)/$(TOP)_pnr.json
FS        := $(BUILD_DIR)/$(TOP).fs

.PHONY: all prog flash clean check dirs

all: $(FS)

check:
	@command -v yosys >/dev/null || (echo "ERROR: yosys not found"; exit 1)
	@command -v nextpnr-himbaechel >/dev/null || (echo "ERROR: nextpnr-himbaechel not found"; exit 1)
	@command -v gowin_pack >/dev/null || (echo "ERROR: gowin_pack not found"; exit 1)

dirs:
	@mkdir -p $(BUILD_DIR)

$(JSON): $(SOURCES) | dirs check
	yosys -p "read_verilog $(SOURCES); synth_gowin -top $(TOP) -json $(JSON)"

$(PNR_JSON): $(JSON) $(CST)
	nextpnr-himbaechel \
		--json $(JSON) \
		--write $(PNR_JSON) \
		--device $(DEVICE) \
		--vopt family=$(FAMILY) \
		--vopt cst=$(CST)

$(FS): $(PNR_JSON)
	gowin_pack -d $(FAMILY) -o $(FS) $(PNR_JSON)

prog: $(FS)
	openFPGALoader -b $(BOARD) $(FS)

flash: $(FS)
	openFPGALoader -b $(BOARD) -f $(FS)

clean:
	rm -rf $(BUILD_DIR)
