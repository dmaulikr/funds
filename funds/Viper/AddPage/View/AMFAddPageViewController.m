//
//  AMFAddPageViewController.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageViewController.h"
#import "AMFPageProtocol.h"

#import "AMFAddPageViewOutput.h"

@interface AMFAddPageViewController ()

@property (nonatomic, weak) IBOutlet UITextField *pageName;

@end

@implementation AMFAddPageViewController

@synthesize page;

#pragma mark - Live cycle methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

- (void)done {
    if (self.page)
        [self.output updatePage:self.page withName:self.pageName.text];
    else
        [self.output createNewWithPageName:self.pageName.text];
}

#pragma mark - Methods of AMFAddPageViewInput

- (void)setupInitialState {
    if (!self.navigationItem.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"done"]
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(done)];
        self.navigationItem.rightBarButtonItem = done;
    }
    if (self.page) { // if user wants to change current page
        self.pageName.text = page.name;
    } else { // or if user wants to create a new one
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitMonth | NSCalendarUnitYear)
                                                       fromDate:[NSDate date]];
        if (dateComponents.month < 12)
            [dateComponents setMonth:dateComponents.month + 1];
        else {
            [dateComponents setMonth:1];
            [dateComponents setYear:dateComponents.year + 1];
        }
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSArray *months = [formatter standaloneMonthSymbols];
        self.pageName.text = [NSString stringWithFormat:@"%@ %ld",
                              [months[dateComponents.month - 1] capitalizedString],
                              dateComponents.year];
    }
}

#pragma mark - Themes

- (void)applyTheme {
    [super applyTheme];
}

@end
