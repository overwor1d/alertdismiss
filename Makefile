ARCHS := arm64 arm64e
TARGET := iphone:clang:16.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AlertDismiss
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
