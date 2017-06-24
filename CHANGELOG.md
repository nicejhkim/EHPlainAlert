### Version 1.2.5
methods added:
	+ (void)updateShouldHideOnTap:(BOOL)hide;
	+ (void)updateShouldShowCloseIcon:(BOOL)show;
properties added:
	@property (nonatomic, assign) EHBoolean shouldHideOnTap;
	@property (nonatomic, assign) EHBoolean shouldShowCloseIcon;


### Version 1.2.5
methods added:
	-hide
	+hideAll:animated


### Version 1.2.1
Test updated

### Version 1.2.0
Added appearance customization

### Version 1.1.1
Fixing pods bundle bug

### Version 1.1.0
Icons customization

### Version 1.0.6
Static methods for changing default behavior.
	+ (void)updateNumberOfAlerts:(NSInteger)numberOfAlerts;
	+ (void)updateHidingDelay:(float)delay;
	+ (void)updateTitleFont:(UIFont *)titleFont;
	+ (void)updateSubTitleFont:(UIFont *)subtitleFont;
	+ (void)updateAlertColor:(UIColor *)color forType:(ViewAlertType)type;

### Version 1.0.1
* Added Changelog

## Version 1.0

* Customisation for colors, icons, fonts, action blocks, number of onscreen messages
* Simple presenting errors
* XCTest
