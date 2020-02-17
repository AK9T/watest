"ARCHS = armv7 arm64"
INSTALL_TARGET_PROCESSES = SpringBoard

BUNDLE_NAME = com.akshu.khamankar
com.akshu.khamankar_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WAPrompt

WAPrompt_FILES = Tweak.xm Goku.m
WAPrompt_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += watest
include $(THEOS_MAKE_PATH)/aggregate.mk
