ARCHS = arm64e arm64 armv7

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AlertsPercent
AlertsPercent_FILES = Tweak.xm
THEOS_DEVICE_IP = 10.0.0.7
AlertsPercent_FRAMEWORKS = AVFoundation AudioToolbox

BUNDLE_NAME = com.yakir.alertspercent
com.yakir.alertspercent_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	echo "Real All The Time."
	install.exec "killall -9 SpringBoard"
	
SUBPROJECTS += alertspercent
include $(THEOS_MAKE_PATH)/aggregate.mk
