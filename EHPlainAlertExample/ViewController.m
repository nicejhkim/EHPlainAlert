//
//  ViewController.m
//  EHPlainAlertExample
//
//  Created by Danila Gusev on 17/03/2016.
//  Copyright © 2016 josshad. All rights reserved.
//

#import "ViewController.h"
#import "EHPlainAlert.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [EHPlainAlert updateAlertPosition:ViewAlertPositionBottom];
//    [EHPlainAlert updateTitleFont:[UIFont fontWithName:@"TrebuchetMS" size:18]];
//    [EHPlainAlert updateSubTitleFont:[UIFont fontWithName:@"TrebuchetMS" size:10]];
//    [EHPlainAlert updateNumberOfAlerts:4];
//    [EHPlainAlert updateAlertColor:[UIColor colorWithWhite:0 alpha:0.5] forType:ViewAlertPanic];
//    [EHPlainAlert updateHidingDelay:2.5f];
//    [EHPlainAlert updateAlertIcon:nil forType:ViewAlertInfo]; 
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}


- (IBAction)successAlert:(id)sender
{
    [EHPlainAlert showAlertWithTitle:@"Success" message:@"Something works!" type:ViewAlertSuccess];
}

- (IBAction)failureAlert:(id)sender
{
    NSError * error = [[NSError alloc] initWithDomain:@"My domain"
                                                 code:1337
                                             userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                                        NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The operation timed out.", nil),
                                                        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Have you tried turning it off and on again?", nil)}];
    [EHPlainAlert showError:error];
}

- (IBAction)infoAlert:(id)sender
{
    EHPlainAlert * ehAlert = [[EHPlainAlert alloc] initWithTitle:@"Info" message:@"This is info message" type:ViewAlertInfo];
    ehAlert.titleFont = [UIFont fontWithName:@"TrebuchetMS" size:15];
    ehAlert.subTitleFont = [UIFont fontWithName:@"TrebuchetMS-Italic" size:12];
    [ehAlert show];

}

- (IBAction)panicAlert:(id)sender
{
    [EHPlainAlert showAlertWithTitle:@"Panic!" message:@"Something brokе!" type:ViewAlertPanic];
}

- (IBAction)infoWithSafari:(id)sender
{
    EHPlainAlert * ehAlert = [[EHPlainAlert alloc] initWithTitle:@"Hmm..." message:@"Tap for information" type:ViewAlertInfo];
    ehAlert.action = ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/josshad/EHPlainAlert"]];
    };
    ehAlert.messageColor = [UIColor blueColor];
    ehAlert.iconImage = nil;
    [ehAlert show];
}

- (IBAction)hideAll:(id)sender
{
    [EHPlainAlert hideAll:YES];
}
@end
