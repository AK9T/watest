INSTALL_TARGET_PROCESSES = SpringBoard

BUNDLE_NAME = com.akshu.khamankar

com.akshu.khamankar_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WAPrompt

WAPrompt_FILES = Tweak.x
WAPrompt_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk
