//
//  AMFAddPageViewController.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageViewController.h"

#import "AMFAddPageViewOutput.h"

@interface AMFAddPageViewController ()

@property (nonatomic, weak) IBOutlet UITextField *pageName;

@end

@implementation AMFAddPageViewController

#pragma mark - Live cycle methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

- (void)done {
    [self.output doneWithPageName:self.pageName.text];
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
}

#pragma mark - Themes

- (void)applyTheme {
    [super applyTheme];
}

@end
