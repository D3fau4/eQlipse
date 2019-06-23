sdready := sd-ready/eqlipse

define gen_cfw_output
	@mkdir -p sd-ready/$(1)/titles/010000000000CAFE
	@touch sd-ready/$(1)/titles/010000000000CAFE/boot2.flag
	@cp -f eQlipseTarget/eQlipseTarget.nsp sd-ready/$(1)/titles/010000000000CAFE/exefs.nsp
	@mkdir -p $(sdready)/bin/Menu $(sdready)/bin/LibraryAppletHbTarget $(sdready)/bin/SystemApplicationHbTarget
	@cp -f boot.json $(sdready)/boot.json
	@cp -f eQlipseMenu/eQlipseMenu.nsp $(sdready)/bin/Menu/exefs.nsp
	@cp -f eQlipseMenu/eQlipseMenu.romfs $(sdready)/bin/Menu/romfs.bin
	@touch $(sdready)/bin/Menu/fsmitm.flag
	@cp -f HomebrewTarget/LibraryAppletHbTarget/LibraryAppletHbTarget.nsp $(sdready)/bin/LibraryAppletHbTarget/exefs.nsp
	@cp -f HomebrewTarget/SystemApplicationHbTarget/SystemApplicationHbTarget.nsp $(sdready)/bin/SystemApplicationHbTarget/exefs.nsp
	@mkdir -p $(sdready)/themes
	@cp -rf BrightTheme $(sdready)/themes/BrightTheme
endef

all:
	$(MAKE) -C eQlipseTarget/
	$(MAKE) -C HomebrewTarget/
	$(MAKE) -C eQlipseMenu/
	@rm -rf sd-ready
	$(call gen_cfw_output,atmosphere)
	$(call gen_cfw_output,ReiNX)

atmo:
	$(MAKE) -C eQlipseTarget/
	$(MAKE) -C HomebrewTarget/
	$(MAKE) -C eQlipseMenu/
	@rm -rf sd-ready
	$(call gen_cfw_output,atmosphere)

reinx:
	$(MAKE) -C eQlipseTarget/
	$(MAKE) -C HomebrewTarget/
	$(MAKE) -C eQlipseMenu/
	@rm -rf sd-ready
	$(call gen_cfw_output,ReiNX)
