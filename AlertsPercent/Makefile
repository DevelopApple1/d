ARCHS = arm64e arm64 armv7

include $(THEOS)/makefiles/common.mk
THEOS_DEVICE_IP = 10.0.0.7
BUNDLE_NAME = AlertsPercent
AlertsPercent_FILES = PFCRootListController.m
AlertsPercent_INSTALL_PATH = /Library/PreferenceBundles
AlertsPercent_FRAMEWORKS = UIKit
AlertsPercent_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AlertsPercent.plist$(ECHO_END)
