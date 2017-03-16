//
//  AMFPageChooserViewController.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserViewController.h"
#import "AMFPageProtocol.h"
#import "AMFPageChooserViewOutput.h"

static NSString *const pageChooserCellIndentifier = @"PageCell";

@interface AMFPageChooserViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFPageChooserViewController

@synthesize selectedPage,
pages;

#pragma mark - Initialization of view controller

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Methods of AMFPageChooserViewInput

- (void)setupInitialState {
    // nothing to intialize
}

-(void) placeSelectedPageAtCenter {
    NSInteger index = 0;
    if (self.selectedPage) {
        for (id<AMFPageProtocol> p in self.pages) {
            if ([p.name isEqualToString:self.selectedPage.name]) {
                break;
            }
            else
                index++;
        }
        NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    }
}

- (void)refreshContents {
    [self.tableView reloadData];
}

#pragma mark - Themes

- (void)applyTheme {
    [super applyTheme];
}

#pragma mark - Table View source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pageChooserCellIndentifier];
    id <AMFPageProtocol> page = [self.pages objectAtIndex:indexPath.row];
    if (self.selectedPage && // selected cell could be nil
        [page.name isEqualToString:self.selectedPage.name]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    cell.textLabel.text = page.name;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.output cellSelected:indexPath.row];
}

@end
