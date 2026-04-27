CS2_CONFIG_DIR := $(HOME)/.local/share/steamgames/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/cfg
.PHONY: install update

install:
	# rm -r $(CS2_CONFIG_DIR)/autoexec.cfg
	# rm -r $(CS2_CONFIG_DIR)/januarycfg
	mkdir -p $(CS2_CONFIG_DIR)
	mkdir -p $(CS2_CONFIG_DIR)/januarycfg
	cp -r ./cfg/* $(CS2_CONFIG_DIR)
	@echo "CS2 config copied to game directory."

update:
	cp -r $(CS2_CONFIG_DIR)/autoexec.cfg ./cfg
	cp -r $(CS2_CONFIG_DIR)/januarycfg ./cfg
	@echo "CS2 config copied to repository. Changes ready to commit."
