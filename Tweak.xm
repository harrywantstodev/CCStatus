static NSString* wifiText = @"Wi-Fi: Off";
static NSString* planeText = @"Aeroplane Mode: Off";
static NSString* dndText = @"Do Not Disturb: Off";
static NSString* lockText = @"Portrait Orientation Lock: Off";
static NSString* lowText = @"Low Power Mode: Off";
static NSString* toothText = @"Bluetooth: Off";
static NSString* wifiTextOn = @"Wi-Fi: On";
static NSString* planeTextOn = @"Aeroplane Mode: On";
static NSString* dndTextOn = @"Do Not Disturb: On";
static NSString* lockTextOn = @"Portrait Orientation Lock: On";
static NSString* lowTextOn = @"Low Power Mode: On";
static NSString* toothTextOn = @"Bluetooth: On";

%hook CCUIWiFiSetting
+ (NSString *)statusOffString
{
	return wifiText;
}

+ (NSString *)statusOnString
{
	return wifiTextOn;
}
%end

%hook CCUILowPowerModeSetting
+ (NSString *)statusOffString
{
	return lowText;
}

+ (NSString *)statusOnString
{
	return lowTextOn;
}
%end

%hook CCUIAeroplaneModeSetting
+ (NSString *)statusOffString
{
	return planeText;
}

+ (NSString *)statusOnString
{
	return planeTextOn;
}
%end

%hook CCUIBluetoothSetting
+ (NSString *)statusOffString
{
	return toothText;
}

+ (NSString *)statusOnString
{
	return toothTextOn;
}
%end

%hook CCUIDoNotDisturbSetting
+ (NSString *)statusOffString
{
	return dndText;
}

+ (NSString *)statusOnString
{
	return dndTextOn;
}
%end

%hook CCUIOrientationLockSetting
+ (NSString *)statusOffString
{
	return lockText;
}

+ (NSString *)statusOnString
{
	return lockTextOn;
}
%end

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.harrywantstodev.ccstatus.plist"];
    if(prefs)
    {
        wifiText = ( [prefs objectForKey:@"wifiText"] ? [prefs objectForKey:@"wifiText"] : wifiText );
        [wifiText retain];
        dndText = ( [prefs objectForKey:@"dndText"] ? [prefs objectForKey:@"dndText"] : dndText );
        [dndText retain];
        lowText = ( [prefs objectForKey:@"lowText"] ? [prefs objectForKey:@"lowText"] : lowText );
        [lowText retain];
        lockText = ( [prefs objectForKey:@"lockText"] ? [prefs objectForKey:@"lockText"] : lockText );
        [lockText retain];
        toothText = ( [prefs objectForKey:@"toothText"] ? [prefs objectForKey:@"toothText"] : toothText );
        [toothText retain];
        planeText = ( [prefs objectForKey:@"planeText"] ? [prefs objectForKey:@"planeText"] : planeText );
        [planeText retain];
        wifiTextOn = ( [prefs objectForKey:@"wifiTextOn"] ? [prefs objectForKey:@"wifiTextOn"] : wifiTextOn );
        [wifiTextOn retain];
        dndTextOn = ( [prefs objectForKey:@"dndTextOn"] ? [prefs objectForKey:@"dndTextOn"] : dndTextOn );
        [dndTextOn retain];
        lowTextOn = ( [prefs objectForKey:@"lowTextOn"] ? [prefs objectForKey:@"lowTextOn"] : lowTextOn );
        [lowTextOn retain];
        lockTextOn = ( [prefs objectForKey:@"lockTextOn"] ? [prefs objectForKey:@"lockTextOn"] : lockTextOn );
        [lockTextOn retain];
        toothTextOn = ( [prefs objectForKey:@"toothTextOn"] ? [prefs objectForKey:@"toothTextOn"] : toothTextOn );
        [toothTextOn retain];
        planeTextOn = ( [prefs objectForKey:@"planeTextOn"] ? [prefs objectForKey:@"planeTextOn"] : planeTextOn );
        [planeTextOn retain];
    }
    [prefs release];
}

%ctor
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.harrywantstodev.ccstatus/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}
