# EHPlainAlert

This is simple extension for presenting multiple system-wide notifications from bottom of device screen.

<img src="http://josshad.github.io/EHPlainAlert/EHPlainAlert.gif">

## Requirements

- Requires iOS 7.1 or later
- Requires Automatic Reference Counting (ARC)

##Features

- Supports multiple messages on one screen
- Simple use actions
- Highly customizable

## Installation

### CocoaPods
To install SDCAlertView using CocoaPods, please integrate it in your existing Podfile, or create a new Podfile:

```ruby
platform :ios, '7.1'

target 'MyApp' do
  pod 'EHPlainAlert'
end
```
Then run `pod install`.

### Manual

Add EHPlainAlert folder to your project 


##Usage

	#import <EHPlainAlert/EHPlainAlert.h>

###Presenting notification

All messages can simply presented via static method call:

	[EHPlainAlert showAlertWithTitle:@"Success" message:@"Something works!" type:ViewAlertSuccess];

###Presenting error notification

For simplifying error handling you can use:

	- (void)someError:(NSError *)myError
	{
		[EHPlainAlert showError:error];
	}

###Hiding Messages

Notifications will hidden automatically after 4 seconds. You can override ***EHDEFAULT_HIDING_DELAY*** for change this behavior.

Also you can just tap on message to hide it.

###On Tap Actions

You can change the default behavior for tapping on the notification:

    EHPlainAlert * ehAlert = [[EHPlainAlert alloc] initWithTitle:@"Hmm..." message:@"Tap for information" type:ViewAlertInfo];
    ehAlert.action = ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/josshad/EHPlainAlert"]];
    };
    [ehAlert show];

###Customization

Fonts:

	EHPlainAlert * ehAlert = [[EHPlainAlert alloc] initWithTitle:@"Info" message:@"This is info message" type:ViewAlertInfo];
    ehAlert.titleFont = [UIFont fontWithName:@"TrebuchetMS" size:15];
    ehAlert.subTitleFont = [UIFont fontWithName:@"TrebuchetMS-Italic" size:12];
    [ehAlert show];

Colors:

	EHPlainAlert * ehAlert = [[EHPlainAlert alloc] initWithTitle:@"Hmm..." message:@"Blue color alert" type:ViewAlertInfo];
    ehAlert.messageColor = [UIColor blueColor];
    [ehAlert show];

##Author
Danila Gusev

<a href="mailto:jos.shad@gmail.com">jos.shad@gmail.com</a>

## License

Usage is provided under the <a href="http://opensource.org/licenses/MIT" target="_blank">MIT</a> License. See <a href="https://github.com/josshad/EHPlainAlert/blob/master/LICENSE">LICENSE</a> for full details.
