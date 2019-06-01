#include "PFCRootListController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>

//Paths and such
#define kIdentifier @"com.yakir.alertspercent"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.yakir.alertspercent.plist"
#define kSettingsChangedNotification (CFStringRef)@"com.yakir.alertspercent/ReloadPrefs"
#define prefsAppID CFSTR("com.yakir.alertspercent")

//Variables for sound playing
static NSString *bundlePrefix = @"/Library/MobileSubstrate/DynamicLibraries/com.yakir.alertspercent.bundle";
static AVAudioPlayer *player;
static AVAudioPlayer *lowplayer;
static NSString *soundFilePath = nil;
static NSURL *soundFileURL;
static NSInteger sound;
static NSInteger lowsound;

@implementation PFCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

//Twitter action
- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/DevelopApple"] options:[NSDictionary new] completionHandler:nil];
}




//Paypal action
- (void)openPaypal {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/developapple"] options:[NSDictionary new] completionHandler:nil];
}



//Plays the Health Up Sound
- (void)playSound {
	reloadPrefs();

	//Sets the sound paths sound
	if (sound == 0)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario.mp3", bundlePrefix];
    else if (sound == 1)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 1.mp3", bundlePrefix];
    else if (sound == 2)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 2.mp3", bundlePrefix];
    else if (sound == 3)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 3.mp3", bundlePrefix];
    else if (sound == 4)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 4.mp3", bundlePrefix];
    else if (sound == 5)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 5.mp3", bundlePrefix];
    else if (sound == 6)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 6.mp3", bundlePrefix];
    else if (sound == 7)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 7.mp3", bundlePrefix];
    else if (sound == 8)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 8.mp3", bundlePrefix];
    else if (sound == 9)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 9.mp3", bundlePrefix];
    else if (sound == 10)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 10.mp3", bundlePrefix];
    else if (sound == 11)
        soundFilePath = [NSString stringWithFormat:@"%@/sos morse code.wav", bundlePrefix];
    else if (sound == 12)
        soundFilePath = [NSString stringWithFormat:@"%@/service bell.wav", bundlePrefix];
    else if (sound == 13)
        soundFilePath = [NSString stringWithFormat:@"%@/Samsung Low battery Sound Effect.mp3", bundlePrefix];
    else if (sound == 14)
        soundFilePath = [NSString stringWithFormat:@"%@/Music Box.wav", bundlePrefix];
    else if (sound == 15)
        soundFilePath = [NSString stringWithFormat:@"%@/Electrical.wav", bundlePrefix];
    
    else if (sound == 16)
        soundFilePath = [NSString stringWithFormat:@"%@/Doorbell.wav", bundlePrefix];
    else if (sound == 17)
        soundFilePath = [NSString stringWithFormat:@"%@/bell.wav", bundlePrefix];
    else if (sound == 18)
        soundFilePath = [NSString stringWithFormat:@"%@/alert.wav", bundlePrefix];


	//Grabs the sound file from the bundle path and makes the NSURL equal to it
	soundFileURL = [NSURL fileURLWithPath:soundFilePath];

	//Makes the audio player object and plays the sound 0(actually 1) time(s)
	player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
	player.numberOfLoops = 3;
    
	[player play];
}

//Plays the Low Health Sound
- (void)playlowSound {
	reloadPrefs();

	if (lowsound == 0)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario.mp3", bundlePrefix];
    else if (lowsound == 1)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 1.mp3", bundlePrefix];
    else if (lowsound == 2)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 2.mp3", bundlePrefix];
    else if (lowsound == 3)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 3.mp3", bundlePrefix];
    else if (lowsound == 4)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 4.mp3", bundlePrefix];
    else if (lowsound == 5)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 5.mp3", bundlePrefix];
    else if (lowsound == 6)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 6.mp3", bundlePrefix];
    else if (lowsound == 7)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 7.mp3", bundlePrefix];
    else if (lowsound == 8)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 8.mp3", bundlePrefix];
    else if (lowsound == 9)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 9.mp3", bundlePrefix];
    else if (lowsound == 10)
        soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 10.mp3", bundlePrefix];
    else if (lowsound == 11)
        soundFilePath = [NSString stringWithFormat:@"%@/sos morse code.wav", bundlePrefix];
    else if (lowsound == 12)
        soundFilePath = [NSString stringWithFormat:@"%@/service bell.wav", bundlePrefix];
    else if (lowsound == 13)
        soundFilePath = [NSString stringWithFormat:@"%@/Samsung Low battery Sound Effect.mp3", bundlePrefix];
    else if (lowsound == 14)
        soundFilePath = [NSString stringWithFormat:@"%@/Music Box.wav", bundlePrefix];
    else if (lowsound == 15)
        soundFilePath = [NSString stringWithFormat:@"%@/Electrical.wav", bundlePrefix];
    
    else if (lowsound == 16)
        soundFilePath = [NSString stringWithFormat:@"%@/Doorbell.wav", bundlePrefix];
    else if (lowsound == 17)
        soundFilePath = [NSString stringWithFormat:@"%@/bell.wav", bundlePrefix];
    else if (lowsound == 18)
        soundFilePath = [NSString stringWithFormat:@"%@/alert.wav", bundlePrefix];

	soundFileURL = [NSURL fileURLWithPath:soundFilePath];

	lowplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
	lowplayer.numberOfLoops = 3;
	[lowplayer play];
}

//Same method as the Tweak.xm
static void reloadPrefs() {
  CFPreferencesAppSynchronize((CFStringRef)kIdentifier);

  NSDictionary *prefs = nil;
  if ([NSHomeDirectory() isEqualToString:@"/var/mobile"]) {
    CFArrayRef keys = CFPreferencesCopyKeyList((CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

    if (keys != nil) {
      prefs = (NSDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keys, (CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost));

      if (prefs == nil) {
        prefs = [NSDictionary dictionary];
      }
      CFRelease(keys);
    }
  } else {
    prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
  }

  sound = [prefs objectForKey:@"sound"] ? [[prefs objectForKey:@"sound"] integerValue] : 0;
  lowsound = [prefs objectForKey:@"lowsound"] ? [[prefs objectForKey:@"lowsound"] integerValue] : 1;
}
@end
