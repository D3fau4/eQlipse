
all: atmosphere reinx

define gen_cfw_output
	$(MAKE) -C eQlipseTarget/
	$(MAKE) -C HomebrewTarget/
	$(MAKE) -C eQlipseMenu/
	@rm -rf sd-ready
	@mkdir -p sd-ready/$(1)/titles/010000000000CAFE
	@touch sd-ready/$(1)/titles/010000000000CAFE/boot2.flag
	@cp -f eQlipseTarget/eQlipseTarget.nsp sd-ready/$(1)/titles/010000000000CAFE/exefs.nsp
	@mkdir -p sd-ready/eqlipse/bin/{Menu,LibraryAppletHbTarget,SystemApplicationHbTarget}
	@cp -f boot.json sd-ready/eqlipse/boot.json
	@cp -f eQlipseMenu/eQlipseMenu.nsp sd-ready/eqlipse/bin/Menu/exefs.nsp
	@cp -f eQlipseMenu/eQlipseMenu.romfs sd-ready/eqlipse/bin/Menu/romfs.bin
	@touch sd-ready/eqlipse/bin/Menu/fsmitm.flag
	@cp -f HomebrewTarget/LibraryAppletHbTarget/LibraryAppletHbTarget.nsp sd-ready/eqlipse/bin/LibraryAppletHbTarget/exefs.nsp
	@cp -f HomebrewTarget/SystemApplicationHbTarget/SystemApplicationHbTarget.nsp sd-ready/eqlipse/bin/SystemApplicationHbTarget/exefs.nsp
	@mkdir -p sd-ready/eqlipse/themes
	@cp -rf BrightTheme sd-ready/eqlipse/themes/BrightTheme
endef

atmosphere:
	$(call gen_cfw_output,atmosphere)

reinx:
	$(call gen_cfw_output,ReiNX)
