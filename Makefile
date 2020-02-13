INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WAPrompt

WAPrompt_FILES = Tweak.x
WAPrompt_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
