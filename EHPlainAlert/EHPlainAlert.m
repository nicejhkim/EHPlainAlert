//
//  EHPlainAlert.m
//  HMTest
//
//  Created by Danila Gusev on 09/10/15.
//  Copyright © 2015 josshad. All rights reserved.
//

#import "EHPlainAlert.h"
#import "UIColor+EHColorAdditions.h"

#define EHDEFAULT_TITLE_FONT [UIFont fontWithName:@"HelveticaNeue-Light" size:15]
#define EHDEFAULT_SUBTITLE_FONT [UIFont fontWithName:@"HelveticaNeue-Light" size:12]
#define EHDEFAULT_MAX_ALERTS_NUMBER 3
#define EHDEFAULT_HIDING_DELAY 4

@implementation EHPlainAlert
{
    CGSize screenSize;
    ViewAlertType _alertType;
}

static NSMutableArray * currentAlertArray = nil;

+ (instancetype)showError:(NSError *)error
{
    return [self showAlertWithTitle:@"Error" message:error.localizedDescription type:ViewAlertError];
}


+ (instancetype)showDomainError:(NSError *)error
{
    return [self showAlertWithTitle:error.domain message:error.localizedDescription type:ViewAlertError];
}


+ (instancetype)showAlertWithTitle:(NSString *)title message:(NSString *)message type:(ViewAlertType)type
{
    EHPlainAlert * alert = [[EHPlainAlert alloc] initWithTitle:title message:message type:type];
    [alert show];
    return alert;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message type:(ViewAlertType)type;
{
    self = [super init];
    if (self)
    {
        self.titleString = title;
        self.subtitleString = message;
        if (!currentAlertArray)
        {
            currentAlertArray = [NSMutableArray new];
        }
        _alertType = type;
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self)
    {
        if (!currentAlertArray)
        {
            currentAlertArray = [NSMutableArray new];
        }
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    screenSize = [UIScreen mainScreen].bounds.size;
    self.view.frame = CGRectMake(0, screenSize.height, screenSize.width, 70);
    self.view.layer.masksToBounds = NO;
    
    [self constructAlert];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    [self.view addGestureRecognizer:tapGesture];
}


- (void)constructAlert
{
    UIView * infoView = [UIView new];
    infoView.frame = CGRectMake(0, 0, self.view.bounds.size.width , 70);
    
    
    [self.view addSubview:infoView];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, infoView.frame.size.width - 70, infoView.frame.size.height)];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.numberOfLines = 0;
    [infoView addSubview:titleLabel];
    
    NSMutableAttributedString * titleString = [[NSMutableAttributedString alloc] initWithString:_titleString ? _titleString : @""
                                                                                     attributes:@{NSFontAttributeName : _titleFont ? _titleFont : EHDEFAULT_TITLE_FONT}];
    
    NSAttributedString * messageString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",_subtitleString ? _subtitleString : @""]
                                                                         attributes:@{NSFontAttributeName : _subTitleFont ? _subTitleFont : EHDEFAULT_SUBTITLE_FONT}];
    
    [titleString appendAttributedString:messageString];
    
    titleLabel.attributedText = titleString;
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 70)];
    UIColor * bgColor = nil;
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"EHPlainAlert" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage * oImage = nil;
    switch (_alertType) {
        case ViewAlertError:
        {
            bgColor = [UIColor colorWithHex:0xFDB937];
            oImage = [UIImage imageNamed:@"eh_alert_error_icon" inBundle:bundle compatibleWithTraitCollection:nil];
            break;
        }
        case ViewAlertSuccess:
        {
            bgColor = [UIColor colorWithHex:0x49BB7B];
            oImage = [UIImage imageNamed:@"eh_alert_complete_icon" inBundle:bundle compatibleWithTraitCollection:nil];
            break;
        }
        case ViewAlertInfo:
        {
            bgColor = [UIColor colorWithHex:0x00B2F4];
            oImage = [UIImage imageNamed:@"eh_alert_info_icon" inBundle:bundle compatibleWithTraitCollection:nil];
            break;
        }
        case ViewAlertPanic:
        {
            bgColor = [UIColor colorWithHex:0xf24841];
            oImage = [UIImage imageNamed:@"eh_alert_error_icon" inBundle:bundle compatibleWithTraitCollection:nil];
            break;
        }
        default:
            bgColor = [UIColor colorWithHex:0xFDB937];
            break;
    }
    
    infoView.backgroundColor = _messageColor ? _messageColor : bgColor;
    
    imageView.image = _iconImage ? _iconImage : oImage;
    
    imageView.alpha = 0.4;
    imageView.contentMode = UIViewContentModeCenter;
    [infoView addSubview:imageView];
    
    UIImageView * closeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eh_alert_close_icon" inBundle:bundle compatibleWithTraitCollection:nil]];
    closeView.frame = CGRectMake(infoView.bounds.size.width - 15, 8, 7, 7);
    closeView.contentMode = UIViewContentModeCenter;
    [infoView addSubview:closeView];
}

- (void)show
{
    [self performSelectorOnMainThread:@selector(showInMain) withObject:nil waitUntilDone:NO];
}

- (void)showInMain
{
    if ([currentAlertArray count] == EHDEFAULT_MAX_ALERTS_NUMBER)
    {
        [[currentAlertArray firstObject] hide:@(YES)];
    }
    
    NSInteger numberOfAlerts = [currentAlertArray count];
    if (numberOfAlerts == 0)
        [([UIApplication sharedApplication].delegate).window addSubview:self.view];
    else
        [([UIApplication sharedApplication].delegate).window insertSubview:self.view belowSubview:[((EHPlainAlert *)[currentAlertArray lastObject]) view]];
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, screenSize.height - 70 * (numberOfAlerts + 1) - 0.5 * (numberOfAlerts), screenSize.width, 70);
    }];
    
    [currentAlertArray addObject:self];
    
    [self performSelector:@selector(hide:) withObject:@(YES) afterDelay:EHDEFAULT_HIDING_DELAY];
}

- (void)hide:(NSNumber *)nAnimated
{
    [self performSelectorOnMainThread:@selector(hideInMain:) withObject:nAnimated waitUntilDone:NO];
}

- (void)hideInMain:(NSNumber *)nAnimated
{
    [currentAlertArray removeObject:self];
    BOOL animated = [nAnimated boolValue];
    if (animated)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.view.alpha = 0.7;
            self.view.frame = CGRectMake(0, screenSize.height, screenSize.width , 70);
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
        }];
        
        for (int i = 0; i < [currentAlertArray count]; i++)
        {
            EHPlainAlert * alert = [currentAlertArray objectAtIndex:i];
            [UIView animateWithDuration:0.5 animations:^{
                alert.view.frame = CGRectMake(0, screenSize.height - 70 * (i + 1) - 0.5 * (i), screenSize.width, 70);
            }];
        }
    }
    else
    {
        [self.view removeFromSuperview];
    }
}

- (void)hide
{
    [self hide:@(YES)];
}

- (void)onTap
{
    [self hide];
    
    if (_action != nil)
    {
        _action();
    }
}


@end
