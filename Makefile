INSTALL_TARGET_PROCESSES = SpringBoard

BUNDLE_NAME = com.akshu.khamankar


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WAPrompt

WAPrompt_FILES = Tweak.x Goku.m
WAPrompt_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk


internal-stage::
	mkdir -p "$(THEOS_STAGING_DIR)/Library/Application Support/WATest.bundle"
	cp Resources/* "$(THEOS_STAGING_DIR)/Library/Application Support/WATest.bundle/"