.PHONY: compile

OUTPUT_DIR = public_html

compile:
	mkdir -p $(OUTPUT_DIR) && phr up . $(OUTPUT_DIR)
